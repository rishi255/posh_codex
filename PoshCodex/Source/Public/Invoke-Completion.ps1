function Invoke-Completion {
	# Add cmdletBinding to the parameter list
	[CmdletBinding()]
	param()
	
	#? If $env:OPENAI_API_KEY is not set, then print message and exit.
	if ($null -eq $env:OPENAI_API_KEY) {
		Write-Color "`n`$env:OPENAI_API_KEY", " is not set! Please set it using the following command:`n",
		"`$env:OPENAI_API_KEY = `"YOUR_API_KEY`"`n",
		"Then, restart the shell and try again.`n" -Color White, Red, Blue, Red

		return
	}

	Add-Type -AssemblyName System.Windows.Forms

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
		# Write-Color "JSON_OUTPUT:" -Color Magenta
		# Write-Color $json_output.choices[0] -Color Magenta

		# Insert the completion on the next line. This will NOT cause the command to be executed.
		[Microsoft.PowerShell.PSConsoleReadLine]::InsertLineBelow();
		[Microsoft.PowerShell.PSConsoleReadLine]::Insert($completion)
	}
	else {
		Write-Color "Response returned by OpenAI API is null! It could be an internal error or an issue with your API key. Please check your API key and try again." -Color Red
	}
}

# TODO: Add a way to make this key handler dynamically assigned (i.e. user can assign the keybind).
Set-PSReadLineKeyHandler -Chord "Ctrl+Alt+x" `
	-BriefDescription Invoke-Completion `
	-LongDescription "Autocomplete the stuff" `
	-ScriptBlock { Invoke-Completion }

# Export-ModuleMember -ModuleDefinition $PSModuleInfo -MemberType Function -Name Invoke-Completion -Function Invoke-Completion