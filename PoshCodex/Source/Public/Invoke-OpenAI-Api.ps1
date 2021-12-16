function Invoke-OpenAI-Api {
	param (
		$BUFFER
	)

	# [Microsoft.PowerShell.PSConsoleReadLine]::AddToHistory($line)
	# [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()

	$data = @{
		prompt            = "#!powershell \n\n" + $BUFFER
		max_tokens        = 64
		temperature       = 0
		top_p             = 1.0
		frequency_penalty = 0.0
		presence_penalty  = 0.0
		stop              = """"""""
	}

	$json_output = Invoke-RestMethod "https://api.openai.com/v1/engines/davinci/completions" `
		-Body (ConvertTo-Json $data) `
		-ContentType "application/json" `
		-Authentication Bearer `
		-Token  ( ConvertTo-SecureString -String $env:OPENAI_API_KEY -AsPlainText) `
		-Method POST

	# Write-Color $json_output -Color Magenta
	return $json_output
}