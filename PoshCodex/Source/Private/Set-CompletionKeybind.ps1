#Requires -Modules PSReadLine

# Function to simply handle the setting and removal of keybinds, without worrying about the user input.
function Set-CompletionKeybind {
	# Add cmdletBinding to the parameter list
	[CmdletBinding()]
	param(
		$old_keybind, $new_keybind
	)

	if ($null -ne $old_keybind) {
		# unset current handler for Write-Completion if it exists
		Remove-PSReadLineKeyHandler -Chord $old_keybind
		Write-Host "Previous keybind removed: $old_keybind"
	}
	
	Set-PSReadLineKeyHandler -Chord $new_keybind `
		-BriefDescription Write-Completion `
		-LongDescription 'Autocomplete the command' `
		-ScriptBlock { Write-Completion }
	
	# Update env var with new keybind
	[Environment]::SetEnvironmentVariable('AUTOCOMPLETE_KEYBIND', $new_keybind, [System.EnvironmentVariableTarget]::User)
}