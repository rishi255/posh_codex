function Invoke-Ollama-Api {
	[CmdletBinding()]
	param (
		$BUFFER
	)

	# [Microsoft.PowerShell.PSConsoleReadLine]::AddToHistory($line)
	# [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()

	$data = @{
		model  = "$env:OLLAMA_MODEL"
		prompt = $BUFFER
		stream = $false
	}

	$json_output = Invoke-RestMethod -Method POST `
		-Uri "$env:OLLAMA_HOST/api/generate" `
		-Body ($data | ConvertTo-Json) `
		-ContentType 'application/json; charset=utf-8';

	return $json_output
}