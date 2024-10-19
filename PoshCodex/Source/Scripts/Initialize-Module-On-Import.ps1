## Set necessary environment variables:

[Environment]::SetEnvironmentVariable('OLLAMA_HOST', 'http://localhost:11434', [EnvironmentVariableTarget]::User)
[Environment]::SetEnvironmentVariable('OLLAMA_MODEL', 'rishi255/posh_codex_model', [EnvironmentVariableTarget]::User)

$current_keybind = [Environment]::GetEnvironmentVariable('AUTOCOMPLETE_KEYBIND', 'User')

$default_keybind = if ([String]::IsNullOrWhiteSpace($current_keybind)) {
	## Use default keybind, if none is set
	'Ctrl+Shift+O'
}
else {
	## Use existing keybind
	$current_keybind
}
Set-CompletionKeybind $null $default_keybind

## Check if Ollama is installed in the user or system PATH
if (Get-Command -Name 'ollama' -CommandType 'Application' -ErrorAction Ignore) {
	## Check if Ollama is running
	if (-not (Get-Process -Name 'ollama' -ErrorAction Ignore)) {
		## Start Ollama if it's not running
		Start-Process -FilePath 'ollama' -ArgumentList 'serve' -WindowStyle Hidden
	}
} else {
	Write-Warning 'Ollama is not installed or not in the user or system PATH.'
	Write-Warning 'Please follow the instructions at "https://github.com/rishi255/posh_codexnstall" and re-import the module.'
}
