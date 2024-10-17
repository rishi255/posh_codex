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
