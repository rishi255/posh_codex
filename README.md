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
      src="https://img.shields.io/github/workflow/status/rishi255/posh_codex/Build%20and%20Publish%20Module?colorA=2c2837&style=for-the-badge"
      alt="GitHub Workflow build status"
    />
  </a>
</div>
<br/>
<div align="center">
  <img
    src="https://raw.githubusercontent.com/tom-doerr/bins/main/zsh_codex/zc4.gif"
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

Forked from the impressive [zsh version of this extension by Tom Doerr](https://github.com/tom-doerr/zsh_codex).

## How to Install

### 1. Through PowerShellGallery (recommended, cross-platform)

```powershell
# to install or update to the latest version
Install-Module -Name PoshCodex -Force

Import-Module PoshCodex -Force

# to check if it's installed properly:
Get-Module -Name PoshCodex # should display the Write-Completion command

# Auto-import the module on every powershell session, so you can directly use the keybind for completion:
echo "`nImport-Module PoshCodex" >> $PROFILE
```

### 2. Through Scoop (Windows only)

Scoop is an easy-to-use command-line installer for Windows apps. You can get Scoop from [here](https://scoop.sh/).

```powershell
scoop bucket add poshcodex_bucket https://github.com/rishi255/posh_codex
scoop install PoshCodex # not case sensitive

# to update the module later:
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
# See above step for auto-import on every powershell session.
```

## Configuration of the Ollama Model

**Note:** The AI completion will run locally on your machine, and the below commands will download the model file.

```powershell
# install ollama
scoop bucket add versions
scoop install versions/innounp-unicode
scoop install ollama

# pull the base model
ollama pull rishi255/posh_codex_model

# or, create a new model tailored for your needs using Modelfile.txt
# (refer https://github.com/ollama/ollama/blob/main/docs/modelfile.md)
ollama create my_model -f .\Modelfile.txt
echo "`n$env:OLLAMA_MODEL='my_model'" >> $PROFILE
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

When you import the module for the first time, you can enter your own keybind. Just type `Enter-CompletionKeybind` in the terminal and record the keyboard shortcut you want to use.

## TODO checklist

- [x] Test basic PS plugin working with hardcoded completions
- [x] Test plugin by comparing the generated output from [my text-to-PowerShell OpenAI playground](https://platform.openai.com/playground/chat?models=gpt-3.5-turbo-0125&preset=4FqkeG4WQuIPfOUS6cvXQfQR)
- [x] Publish plugin for installation through PSGallery
- [x] Add installation instructions to README.md
- [x] Integrate with GitHub Actions to auto-publish new versions
- [x] Make required modules auto-install when this module is installed
- [x] Publish plugin for installation through Scoop
- [x] Add a way to change the hotkey for completion - default is `Ctrl+Alt+x`
- [x] Add a way to change the hotkey for completion by reading key input, instead of user having to call function`
- [ ] Stream the output, instead of waiting for entire thing to be generated
  - [ ] OR Show a progress/loading indicator when inference is running
- [ ] Add proper documentation in `PoshCodex/Docs/about_PoshCodex.md` and `PoshCodex/Docs/Write-Completion.md`
- [ ] Add GIF of working demo in terminal
- [ ] Make completed text a lighter colour to show that it is only a potential solution
- [ ] Cycle through suggestions using some modifiable keybind (e.g. `Alt+C`)
- [ ] Make a website playground that lets users try this out live using my API key
