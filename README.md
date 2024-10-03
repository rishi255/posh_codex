<html>
<h1 align="center">⌨️ 🦾 PowerShell Codex</h1>

<div align="center">
  Brings the power of AI code completion to the command line.
</div>

<br/>

<div align="center">
  <a href="https://www.powershellgallery.com/packages/PoshCodex">
    <img
        src="https://img.shields.io/powershellgallery/v/PoshCodex?colorA=2c2837&style=for-the-badge"
        alt="PowerShell package latest version"
    />
  </a>
  <a href="https://www.powershellgallery.com/packages/PoshCodex">
    <img
      src="https://img.shields.io/powershellgallery/dt/PoshCodex?colorA=2c2837&style=for-the-badge"
      alt="PowerShell package download stats"
    />
  </a>
  <a href="https://github.com/rishi255/posh_codex/stargazers">
    <img
      src="https://img.shields.io/github/stars/rishi255/posh_codex?colorA=2c2837&style=for-the-badge"
      alt="Repository's stars"
    />
  </a>
  <br />
  <a href="https://github.com/rishi255/posh_codex/issues">
    <img
      src="https://img.shields.io/github/issues-raw/rishi255/posh_codex?colorA=2c2837&style=for-the-badge"
      alt="Issues"
    />
  </a>
  <a href="https://github.com/rishi255/posh_codex/blob/main/LICENSE">
    <img
      src="https://img.shields.io/github/license/rishi255/posh_codex?colorA=2c2837&style=for-the-badge"
      alt="License"
    />
  </a>
  <a href="https://github.com/rishi255/posh_codex/commits/main">
    <img
      src="https://img.shields.io/github/last-commit/rishi255/posh_codex/main?colorA=2c2837&style=for-the-badge"
      alt="Latest commit"
    />
  </a>
  <a href="https://github.com/rishi255/posh_codex">
    <img
      src="https://img.shields.io/github/actions/workflow/status/rishi255/posh_codex/main.yml?branch=main&colorA=2c2837&style=for-the-badge"
      alt="GitHub Workflow build status"
    />
  </a>
</div>
<br/>
<div align="center">
  <img
   src="assets/PoshCodex_Demo.gif"
   style="width: 80%"
   alt="PoshCodex Demo"
   />
  <div align="center">
    You just need to write a comment or variable name and the AI will write the
    corresponding code.
  </div>
</div>
</html>

## What is it?

This is a PowerShell plugin that enables you to plug and play any AI code completion model in the command line, to improve efficiency, reduce errors and optimize your workflow.

It is completely free, as it can be used with any open-source model from Ollama, like [CodeLlama](https://ollama.com/library/codellama), or the powerful [Deepseek-Coder-v2](https://ollama.com/library/deepseek-coder:6.7b) (default for this module).

Inspired by the impressive [zsh version of this extension by Tom Doerr](https://github.com/tom-doerr/zsh_codex).

## How to Install

### 1. Using PowerShellGallery (recommended, cross-platform)

```powershell
# to install or update to the latest version
Install-Module -Name PoshCodex -Force

Import-Module PoshCodex -Force

# to check if it's installed properly:
Get-Module -Name PoshCodex # should display the Enter-CompletionKeybind command

# Auto-import the module on every powershell session, so you can directly use the keybind for completion:
echo "`nImport-Module PoshCodex" >> $PROFILE
```

### 2. Using Scoop (Windows only)

Scoop is an easy-to-use command-line installer for Windows apps. You can get Scoop from [here](https://scoop.sh/).

```powershell
scoop bucket add poshcodex_bucket https://github.com/rishi255/posh_codex
scoop install PoshCodex # not case sensitive

Import-Module PoshCodex -Force

# to update the module later, you can use:
scoop update PoshCodex

# Auto-import the module on every powershell session, so you can directly use the keybind for completion:
echo "`nImport-Module PoshCodex" >> $PROFILE
```

### 3. By building the module yourself

```powershell
# Clone the repository
git clone https://github.com/rishi255/posh_codex
cd ./posh_codex/PoshCodex/

# Install Invoke-Build and build the module
Install-Module InvokeBuild -Force
Invoke-Build -File build.ps1

# Now import the built module
Import-Module ./Output/PoshCodex/<version_number>/PoshCodex.psd1

# Now the module can be used in the current powershell session.
# Auto-import the module on every powershell session, so you can directly use the keybind for completion:
echo "`nImport-Module ./Output/PoshCodex/<version_number>/PoshCodex.psd1" >> $PROFILE
```

## Configuration of the Ollama Model

**Note:** The AI completion will run locally on your machine, and the below commands will download the model file.

```powershell
# install ollama
scoop bucket add versions
scoop install versions/innounp-unicode
scoop install ollama

# pull the base model
ollama pull rishi255/posh_codex_model:latest

# or, create a new model tailored for your needs using Modelfile.txt
# (refer https://github.com/ollama/ollama/blob/main/docs/modelfile.md)
ollama create my_model -f .\Modelfile.txt
echo "`n$env:OLLAMA_MODEL='my_model'" >> $PROFILE
```

## Usage

Just type a comment or partial code snippet, and hit the keybind!

See the GIF above for a demonstration.

```powershell
# print hello world to the console
```

`Hit Ctrl+Shift+O after typing the above comment`

## Changing the keybind

**The default keybind is `Ctrl+Shift+O`.**

After you import the module, you can enter your own keybind.  
Just type `Enter-CompletionKeybind` in the terminal and record the keyboard shortcut you want to use.

## Configuration

The following environment variables are available for configuration:

| Environment Variable | Default Value               | Description                                     |
| -------------------- | --------------------------- | ----------------------------------------------- |
| `OLLAMA_MODEL`       | `rishi255/posh_codex_model` | The Ollama model name to use for AI completion. |
| `OLLAMA_HOST`        | `http://localhost:11434`    | The base URL of your Ollama API.                |
| `AUTOCOMPLETE_KEY`   | `Ctrl+Shift+O`              | The keybind to use for AI completion.           |

## The Journey So Far (there's still a lot TODO)

- [x] Test basic PS plugin working with hardcoded completions
- [x] Test plugin by comparing the generated output from [my text-to-PowerShell OpenAI playground](https://platform.openai.com/playground/chat?models=gpt-3.5-turbo-0125&preset=4FqkeG4WQuIPfOUS6cvXQfQR)
- [x] Publish plugin for installation through PSGallery
- [x] Add installation instructions to README.md
- [x] Integrate with GitHub Actions to auto-publish new versions
- [x] Make required modules auto-install when this module is installed
- [x] Publish plugin for installation through Scoop
- [x] Add a way to change the hotkey for completion by reading key input: `Enter-CompletionKeybind`
- [ ] Simplify installation - 3 remote-executable setup scripts - one each for install thru PSGallery, Scoop and self build.
  - [ ] For PSGallery and Scoop, make only one common script - add it to scoop manifest's pre-install section
- [ ] Stream the output, instead of waiting for entire thing to be generated
  - [ ] OR Show a progress/loading indicator when inference is running
- [ ] Need support for inline completion, currently we are inserting the response on a new line
  - [ ] Need to fine tune / prompt engineer the model better for this as well - currently it isn't very good at it
- [ ] Switch to chat API instead of generate - to provide context of previous messages?
- [ ] Switch from environment variables based configuration to a config file (`poshcodex.ini`)
  - [ ] Ensure that getting and setting config values are only done through the config file
  - [ ] After this change, `Initialize-Module-On-Import` needs to call `Set-CompletionKeybind` internally after reading latest value from config.
- [ ] Make completed text a lighter colour to show that it is only a potential solution
  - For changing text colour of prediction, look at `Set-PSReadLineOption` or in that direction
- [ ] Add proper documentation for all the functions and `Docs/about_PoshCodex.md`
- [ ] Support for install using Chocolatey
- [ ] Cycle through suggestions using some modifiable keybind (e.g. `Alt+C`)
- [ ] Make a website playground that lets users try this out live? Need to check feasibility.
