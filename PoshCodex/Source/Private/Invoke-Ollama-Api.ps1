function Invoke-Ollama-Api {
	[CmdletBinding()]
	param (
		$BUFFER
	)

	# [Microsoft.PowerShell.PSConsoleReadLine]::AddToHistory($line)
	# [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()

	$data = @{
		model  = 'posh_codex_model'
		prompt = $BUFFER
		stream = $false
	}

	$json_output = Invoke-RestMethod -Method POST `
		-Uri 'http://localhost:11434/api/generate' `
		-Body ($data | ConvertTo-Json) `
		-ContentType 'application/json; charset=utf-8';

	return $json_output
}