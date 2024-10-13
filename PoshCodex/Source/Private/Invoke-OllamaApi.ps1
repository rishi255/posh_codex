function Invoke-OllamaApi {
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

	$splatRestMethod = @{
		Method      = 'POST'
		Uri         = "$ollama_host/api/generate"
		Body        = ConvertTo-Json -InputObject $data
		ContentType = 'application/json; charset=utf-8'
	}
	Invoke-RestMethod @splatRestMethod
}
