# PoshCodex

## Description

This is a powershell plugin that enables you to use OpenAI's powerful Codex AI in the command line. OpenAI Codex is the AI that also powers GitHub Copilot.
To use this plugin you need to get access to OpenAI's [Codex API](https://openai.com/blog/openai-codex/).

## Configuration of the OpenAI Codex API Key

This module requires access to the OpenAI Codex API for best results. You can join the waitlist for a Codex API key by following the instructions [here](https://openai.com/blog/openai-codex/).

Until you get a Codex API key, you can use the generic [GPT-3 OpenAI API key](https://beta.openai.com/docs/developer-quickstart/your-api-keys) by signing up on the OpenAI website.  
**_However, the base GPT-3 model is not tailored for code completions and hence the suggestions are nowhere as good as the ones from the Codex API._**

The module expects an environment variable called OPENAI_API_KEY to be set in the environment.
You can set it with the following command:

```powershell
$env:OPENAI_API_KEY="your_api_key"
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
