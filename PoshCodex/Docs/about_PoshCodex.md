# PoshCodex

## Description

This is a PowerShell plugin that enables you to plug and play any AI code completion model in the command line, to improve efficiency, reduce errors and optimize your workflow.

It is completely free, as it can be used with any open-source model from Ollama, like [CodeLlama](https://ollama.com/library/codellama), or the powerful [Deepseek-Coder-v2](https://ollama.com/library/deepseek-coder-v2:16b) (default for this module).

Forked from the impressive [zsh version of this extension by Tom Doerr](https://github.com/tom-doerr/zsh_codex).

## Configuration of the Ollama Model

```powershell
# install ollama
scoop bucket add versions
scoop install versions/innounp-unicode
scoop install ollama

# pull the base model
ollama pull deepseek-coder-v2:16b

# create new model tailored for our needs using Modelfile.txt
ollama create posh_codex_model -f .\Modelfile.txt
```

## Usage

Just type a comment or partial code snippet, and hit the keybind!

See the GIF above for a demonstration.

```powershell
# type some comment that describes what you want to do, eg:
"# install the 'scoop' module" # with/without any of the quotes

# Just hit Ctrl+Alt+x (or your own keybind if changed) and the AI will write the corresponding code for you.
```

## Changing the keybind

The module exposes a function to change the keybind to whatever you want to use.
Default keybind is `Ctrl+Alt+x`, and can be changed like this:

```powershell
Set-CompletionKeybind 'Shift+y'
Set-CompletionKeybind 'Tab'

# to set keybind as combination of two chords
Set-CompletionKeybind 'Ctrl+K,Ctrl+E'
```

List of all supported keys that can be separated by + is given [here](https://docs.microsoft.com/en-us/dotnet/api/system.consolekey?view=net-6.0#fields).
