#Requires -Modules PSReadLine

function Write-Completion {
	# Add cmdletBinding to the parameter list
	[CmdletBinding()]
	param()

	$BUFFER = $null
	$cursor = $null

	# read text from current buffer
	[Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$BUFFER, [ref]$cursor)

	# If the buffer text itself contains double quotes, then we need to escape them.
	$BUFFER = $BUFFER.Replace('"', '""')

	$json_output = Invoke-OllamaApi $BUFFER

	# check if json_output is not equal to null
	if ($null -ne $json_output) {
		$completion = $json_output.response

		# Insert the completion on the next line. This will NOT cause the command to be executed.
		[Microsoft.PowerShell.PSConsoleReadLine]::InsertLineBelow();
		[Microsoft.PowerShell.PSConsoleReadLine]::Insert($completion)
	}
	else {
		Write-Host 'Response returned by API is null! It could be an internal error or the model is not installed properly through Ollama. Please fix and try again.' -ForegroundColor Red
	}
}
