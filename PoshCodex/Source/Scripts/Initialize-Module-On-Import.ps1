## Set necessary environment variables:

[Environment]::SetEnvironmentVariable('OLLAMA_HOST', 'http://localhost:11434', [System.EnvironmentVariableTarget]::User)
[Environment]::SetEnvironmentVariable('OLLAMA_MODEL', 'rishi255/posh_codex_model', [System.EnvironmentVariableTarget]::User)


## Set default keybind:

$default_keybind = 'Ctrl+Shift+O'
Set-CompletionKeybind $null $default_keybind;