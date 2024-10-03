function Invoke-Ollama-Api {
	[CmdletBinding()]
	param (
		$BUFFER
	)

	$ollama_model = [Environment]::GetEnvironmentVariable('OLLAMA_MODEL', 'User')
	$ollama_host = [Environment]::GetEnvironmentVariable('OLLAMA_HOST', 'User')

	$data = @{
		model  = "$ollama_model"
		prompt = $BUFFER
		stream = $false
	}

	$json_output = Invoke-RestMethod -Method POST `
		-Uri "$ollama_host/api/generate" `
		-Body ($data | ConvertTo-Json) `
		-ContentType 'application/json; charset=utf-8';

	return $json_output
}