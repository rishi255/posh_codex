#Requires -Modules PSReadLine

$defaultKeybind = 'Ctrl+Shift+X';

function Set-CompletionKeybind {
	# Add cmdletBinding to the parameter list
	[CmdletBinding()]
	param(
		$keybind
	)

	# unset current handler for Write-Completion if it exists
	Remove-PSReadLineKeyHandler -Chord $global:AutocompleteKeybind
	Write-Host "Previous keybind removed: $global:AutocompleteKeybind"

	Set-PSReadLineKeyHandler -Chord $keybind `
		-BriefDescription Write-Completion `
		-LongDescription 'Autocomplete the stuff' `
		-ScriptBlock { Write-Completion }

	Write-Host "New keybind set: $keybind"
	$global:AutocompleteKeybind = $keybind
}

$global:AutocompleteKeybind = $defaultKeybind;
Set-CompletionKeybind $defaultKeybind;