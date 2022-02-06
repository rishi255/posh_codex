#Requires -Modules PSReadLine

$defaultKeybind = 'Ctrl+Alt+x';

function Set-CompletionKeybind {
	# Add cmdletBinding to the parameter list
	[CmdletBinding()]
	param(
		$keybind
	)

	# unset current handler for Write-Completion if it exists
	Remove-PSReadLineKeyHandler -Chord $global:previousKeybind
	Write-Host "Previous keybind removed: $global:previousKeybind"

	Set-PSReadLineKeyHandler -Chord $keybind `
		-BriefDescription Write-Completion `
		-LongDescription 'Autocomplete the stuff' `
		-ScriptBlock { Write-Completion }
	
	Write-Host "New keybind set: $keybind"
	$global:previousKeybind = $keybind
}

$global:previousKeybind = $defaultKeybind;
Set-CompletionKeybind $defaultKeybind;