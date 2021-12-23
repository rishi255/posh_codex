<html>
<h1 align="center">⌨️ 🦾 PowerShell Codex</h1>

<div align="center">
  AI in the command line. Powered by the AI behind GitHub Copilot.
</div>

<br/>

<div align="center">
  <a href="https://www.powershellgallery.com/packages/PoshCodex">
    <img
        src="https://img.shields.io/powershellgallery/v/PoshCodex.svg?colorA=2c2837&style=for-the-badge&logo=starship style=flat-square"
        alt="PowerShell package latest version"
    />
  </a>
  <a href="https://www.powershellgallery.com/packages/PoshCodex">
    <img
      src="https://img.shields.io/powershellgallery/dt/PoshCodex?colorA=2c2837&style=for-the-badge&logo=starship style=flat-square"
      alt="PowerShell package download stats"
    />
  </a>
  <a href="https://github.com/rishi255/posh_codex/stargazers">
    <img
      src="https://img.shields.io/github/stars/rishi255/posh_codex?colorA=2c2837&style=for-the-badge&logo=starship style=flat-square"
      alt="Repository's stars"
    />
  </a>
  <br />
  <a href="https://github.com/rishi255/posh_codex/issues">
    <img
      src="https://img.shields.io/github/issues-raw/rishi255/posh_codex?colorA=2c2837&style=for-the-badge&logo=starship style=flat-square"
      alt="Issues"
    />
  </a>
  <a href="https://github.com/rishi255/posh_codex/blob/main/LICENSE">
    <img
      src="https://img.shields.io/github/license/rishi255/posh_codex?colorA=2c2837&style=for-the-badge&logo=starship style=flat-square"
      alt="License"
    />
  </a>
  <a href="https://github.com/rishi255/posh_codex/commits/main">
    <img
      src="https://img.shields.io/github/last-commit/rishi255/posh_codex/main?colorA=2c2837&style=for-the-badge&logo=starship style=flat-square"
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

This is a powershell plugin that enables you to use OpenAI's powerful Codex AI in the command line. OpenAI Codex is the AI that also powers GitHub Copilot.
To use this plugin you need to get access to OpenAI's [Codex API](https://openai.com/blog/openai-codex/).

Forked from the impressive [zsh version of this extension by Tom Doerr](https://github.com/tom-doerr/zsh_codex).

## How to Install

### 1. Through PowerShellGallery (recommended)

```powershell
Install-Module -Name PoshCodex -Force

# To check if it's installed properly:
Get-Module -Name PoshCodex # should display the Invoke-Completion command

# Auto-import the module on every powershell session, so you can directly use the keybind for completion:
echo "`nImport-Module PoshCodex" >> $PROFILE
```

### 2. Through Scoop

You can get Scoop from [here](https://scoop.sh/).

```powershell
scoop bucket add https://github.com/rishi255/posh_codex
scoop install PoshCodex # not case sensitive

# to update the module later:
scoop update PoshCodex
```

### 3. By building the module yourself

```powershell
# Clone the repository
git clone https://github.com/rishi255/posh_codex
cd .\posh_codex\PoshCodex\

# Install Invoke-Build and build the module
Install-Module InvokeBuild -Force -RequiredVersion 3.2.1
Invoke-Build -File build.ps1 -Configuration 'Release'

# Now import the built module
Import-Module .\Output\PoshCodex\<version_number>\PoshCodex.psd1

# Now the module can be used in the current powershell session.
# See above step for auto-import on every powershell session.
```

## Configuration of the OpenAI Codex API Key

This module requires access to the OpenAI Codex API for best results. You can join the waitlist for a Codex API key by following the instructions [here](https://openai.com/blog/openai-codex/).

Until you get a Codex API key, you can use the [GPT-3 OpenAI API key](https://beta.openai.com/docs/developer-quickstart/your-api-keys) by signing up on the OpenAI website.  
**_However, the base GPT-3 model is not tailored for code completions and hence the suggestions are not even close to the ones from the Codex API._**

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

# Just hit Ctrl+Alt+X (or your own keybind if changed) and the AI will write the corresponding code for you.
```

## TODO checklist

- [x] Test basic PS plugin working with hardcoded completions
- [x] Test plugin by scraping the generated output from [my text-to-PowerShell OpenAI playground.](https://beta.openai.com/playground/p/4FqkeG4WQuIPfOUS6cvXQfQR?model=davinci), until a Codex API key is received.
- [x] Publish package on NuGet for testing whether all is working fine
- [x] Test NuGet package by installing and running
- [x] Publish plugin for installation through PSGallery
- [x] Add installation instructions to README.md
- [x] Integrate with GitHub Actions to auto-publish new versions
- [x] Make required modules auto-install when this module is installed
- [x] Publish plugin for installation through Scoop
- [ ] Add proper documentation in `PoshCodex/Docs/about_PoshCodex.md` and `PoshCodex/Docs/Invoke-Completion.md`
- [ ] Add a way to change the hotkey for completion - currently it's `Ctrl+Alt+x`
- [ ] Test plugin robustness in PowerShell using Codex API key
- [ ] Add GIF of working demo in terminal
- [ ] Make completed text a lighter colour to show that it is only a potential solution
- [ ] Cycle through suggestions using some modifiable keybind (e.g. `Alt+C`)
- [ ] Make a website playground that lets users try this out live using my API key
