param(
	$ModulePath = "$PSScriptRoot\..\..\Source\"
)
# Remove trailing slash or backslash
$ModulePath = $ModulePath -replace '[\\/]*$'
$ModuleName = (Get-Item "$ModulePath\..").Name

# Write-Host "BEFORE:"
# Write-Host "Module Path: $ModulePath"
# Write-Host "Module Name: $ModuleName"
# Write-Host "Module Manifest Path: $ModuleManifestPath"
# Write-Host "Module Manifest Name: $ModuleManifestName"

Describe 'Core Module Tests' -Tags 'CoreModule', 'Unit' {

	It 'Passes Test-ModuleManifest' {
		$ModuleManifestName = 'PoshCodex.psd1'
		$ModuleManifestPath = Join-Path -Path $ModulePath -ChildPath $ModuleManifestName

		Write-Host "Testing Module Manifest"
		Write-Host "Module Path: $ModulePath"
		Write-Host "Module Name: $ModuleName"
		Write-Host "Module Manifest Path: $ModuleManifestPath"
		Write-Host "Module Manifest Name: $ModuleManifestName"

		Test-ModuleManifest -Path $ModuleManifestPath
		$? | Should -Be $true
	}

	It 'Loads from module path without errors' {
		{ Import-Module "$ModulePath\$ModuleName.psd1" -ErrorAction Stop } | Should -Not -Throw
	}

	AfterAll {
		Get-Module -Name $ModuleName | Remove-Module -Force
	}

}
