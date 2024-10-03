#Requires -Modules PSReadLine

# Asks for user input (reads key combinations), calls internal functions to convert to string and set it as the new keybind
function Enter-CompletionKeybind {
	# Add cmdletBinding to the parameter list
	[CmdletBinding()]
	param()

	Write-Host "Press any key or combination (Ctrl, Alt, Shift + other keys) to set the new keybind for PoshCodex. Press 'Escape' to exit."
	# Read the key press
	$key = [System.Console]::ReadKey($true)
	$new_autocomplete_keybind = Convert-KeyPressToString $key
	if ($null -eq $new_autocomplete_keybind) {
		# exit, no input given (user pressed Escape).
		return
	}

	# get old keybind, call set keybind for new 
	$old_autocomplete_keybind = [Environment]::GetEnvironmentVariable('AUTOCOMPLETE_KEYBIND', 'User')
	Set-CompletionKeybind $old_autocomplete_keybind $new_autocomplete_keybind
	Write-Host "New keybind set: $([Environment]::GetEnvironmentVariable('AUTOCOMPLETE_KEYBIND', 'User'))"
}