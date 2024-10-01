#Requires -Modules PSReadLine

# Function to convert a user input key press into a keybind string
function Convert-KeyPressToString {
	# Add cmdletBinding to the parameter list
	[CmdletBinding()]
	param($key)

	# First, check and append Ctrl if it's pressed
	if ($key.Modifiers -band [ConsoleModifiers]::Control) {
		$keybind += 'Ctrl+'
	}

	# Next, check and append Alt if it's pressed
	if ($key.Modifiers -band [ConsoleModifiers]::Alt) {
		$keybind += 'Alt+'
	}

	# Lastly, check and append Shift if it's pressed
	if ($key.Modifiers -band [ConsoleModifiers]::Shift) {
		$keybind += 'Shift+'
	}

	# Append the actual key that was pressed
	$keybind += $key.Key.ToString()

	# Display the keybind string
	# Write-Host "Keybind entered: $keybind"

	# If the Escape key is pressed, exit the loop
	if ($key.Key -eq 'Escape') {
		Write-Host 'Aborted by user, exiting...'
		return $null
	}

	return $keybind
}