#Requires -Modules @{ModuleName='InvokeBuild';ModuleVersion='3.2.1'}
#Requires -Modules @{ModuleName='PowerShellGet';ModuleVersion='1.6.0'}
#Requires -Modules @{ModuleName='Pester';ModuleVersion='4.1.1'}
#Requires -Modules @{ModuleName='ModuleBuilder';ModuleVersion='1.0.0'}

$Script:IsAppveyor = $null -ne $env:APPVEYOR
$Script:ModuleName = Get-Item -Path $BuildRoot | Select-Object -ExpandProperty Name
Get-Module -Name $ModuleName | Remove-Module -Force

task Clean {
	Remove-Item -Path ".\Bin" -Recurse -Force -ErrorAction SilentlyContinue
}

task TestCode {
	Write-Build Yellow "`n`n`nTesting dev code before build"
	$TestResult = Invoke-Pester -Script "$PSScriptRoot\Test\Unit" -Tag Unit -Show 'Header', 'Summary' -PassThru
	if ($TestResult.FailedCount -gt 0) { throw 'Tests failed' }
}

task CompilePSM {
	Write-Build Yellow "`n`n`nCompiling all code into single psm1"
	try {
		$BuildParams = @{}
		if ((Get-Command -ErrorAction stop -Name gitversion)) {
			$GitVersion = gitversion | ConvertFrom-Json | Select-Object -Expand FullSemVer
			$GitVersion = gitversion | ConvertFrom-Json | Select-Object -Expand InformationalVersion
			$BuildParams['SemVer'] = $GitVersion
		}
	}
	catch {
		Write-Warning -Message 'gitversion not found, keeping current version'
	}
	Push-Location -Path "$BuildRoot\Source" -StackName 'InvokeBuildTask'
	$Script:CompileResult = Build-Module @BuildParams -Passthru
	Get-ChildItem -Path "$BuildRoot\license*" | Copy-Item -Destination $Script:CompileResult.ModuleBase
	Pop-Location -StackName 'InvokeBuildTask'
}

task MakeHelp -if (Test-Path -Path "$PSScriptRoot\Docs") {

}

task TestBuild {
	Write-Build Yellow "`n`n`nTesting compiled module"
	$Script = @{Path = "$PSScriptRoot\test\Unit"; Parameters = @{ModulePath = $Script:CompileResult.ModuleBase } }
	$CodeCoverage = (Get-ChildItem -Path $Script:CompileResult.ModuleBase -Filter *.psm1).FullName
	$TestResult = Invoke-Pester -Script $Script -CodeCoverage $CodeCoverage -Show None -PassThru

	if ($TestResult.FailedCount -gt 0) {
		Write-Warning -Message "Failing Tests:"
		$TestResult.TestResult.Where{ $_.Result -eq 'Failed' } | ForEach-Object -Process {
			Write-Warning -Message $_.Name
			Write-Verbose -Message $_.FailureMessage -Verbose
		}
		throw 'Tests failed'
	}

	# $CodeCoverageResult = $TestResult | Convert-CodeCoverage -SourceRoot "$PSScriptRoot\Source" -Relative
	# $CodeCoveragePercent = $TestResult.CodeCoverage.NumberOfCommandsExecuted / $TestResult.CodeCoverage.NumberOfCommandsAnalyzed * 100 -as [int]
	# Write-Verbose -Message "CodeCoverage is $CodeCoveragePercent%" -Verbose
	# $CodeCoverageResult | Group-Object -Property SourceFile | Sort-Object -Property Count | Select-Object -Property Count, Name -Last 10
}

# task . Clean, TestCode, Build

task . Clean, Build

# task Build CompilePSM, MakeHelp, TestBuild

task Build CompilePSM, MakeHelp
