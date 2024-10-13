## Set necessary environment variables:

[Environment]::SetEnvironmentVariable('OLLAMA_HOST', 'http://localhost:11434', [System.EnvironmentVariableTarget]::User)
[Environment]::SetEnvironmentVariable('OLLAMA_MODEL', 'rishi255/posh_codex_model', [System.EnvironmentVariableTarget]::User)


if (-not [Environment]::GetEnvironmentVariable('AUTOCOMPLETE_KEYBIND', 'User')) {
	## Use default keybind, if none is set
	$default_keybind = 'Ctrl+Shift+O'
}
else {
	## Use existing keybind
	$default_keybind = [Environment]::GetEnvironmentVariable('AUTOCOMPLETE_KEYBIND', 'User')
}
Set-CompletionKeybind $null $default_keybind
