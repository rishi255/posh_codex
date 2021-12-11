#!pwsh

# This powershell plugin reads the text from the current buffer and uses a Python script to complete the text.

function New-Completion {
	# read text from current buffer
	$BUFFER = $Host.UI.RawUI.ReadLine()
	$completion = Write-Output -n "$text" | python ./create_completion.py
	# Add completion to the current buffer.
	$BUFFER = $BUFFER + $completion
	# Write the buffer to the console.
	Write-Output "BUFFER: " $BUFFER
	# Put the cursor at the end of the line.
	$Host.UI.RawUI.CursorPosition.X = $Host.UI.RawUI.CursorPosition.X + $completion.Length
}

New-Completion



