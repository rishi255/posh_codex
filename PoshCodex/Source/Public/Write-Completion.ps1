#Requires -Modules PSReadLine

function Write-Completion {
	# Add cmdletBinding to the parameter list
	[CmdletBinding()]
	param()

	#? If $env:OPENAI_API_KEY is not set, then print message and exit.
	if ($null -eq $env:OPENAI_API_KEY) {
		# Write the error output to console without using Write-Color module
		$error_message = "`n`$env:OPENAI_API_KEY is not set! Please set it using the following command:`n`$env:OPENAI_API_KEY = `"YOUR_API_KEY`"`nThen, restart the shell and try again.`n"
		Write-Host "$error_message" -ForegroundColor Red
		return
	}

	$BUFFER = $null
	$cursor = $null

	# read text from current buffer
	[Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$BUFFER, [ref]$cursor)
	
	# If the buffer text itself contains double quotes, then we need to escape them.
	$BUFFER = $BUFFER.Replace('"', '""')

	$json_output = Invoke-OpenAI-Api $BUFFER

	# check if json_output is not equal to null
	if ($null -ne $json_output) {
		$completion = $json_output.choices[0].text

		# Insert the completion on the next line. This will NOT cause the command to be executed.
		[Microsoft.PowerShell.PSConsoleReadLine]::InsertLineBelow();
		[Microsoft.PowerShell.PSConsoleReadLine]::Insert($completion)
	}
	else {
		Write-Host 'Response returned by OpenAI API is null! It could be an internal error or an issue with your API key. Please check your API key and try again.' -ForegroundColor Red
	}
}