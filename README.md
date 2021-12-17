<h1 align="center">⌨️ 🦾 PowerShell Codex</h1>

<p align="center">
    AI in the command line. Powered by the AI behind GitHub Copilot.
</p>

<p align="center">
    <a href="https://github.com/rishi255/posh_codex/stargazers"
        ><img
            src="https://img.shields.io/github/stars/rishi255/posh_codex?colorA=2c2837&style=for-the-badge&logo=starship style=flat-square"
            alt="Repository's starts"
    /></a>
    <a href="https://github.com/rishi255/posh_codex/issues"
        ><img
            src="https://img.shields.io/github/issues-raw/rishi255/posh_codex?colorA=2c2837&style=for-the-badge&logo=starship style=flat-square"
            alt="Issues"
    /></a>
    <a href="https://github.com/rishi255/posh_codex/blob/main/LICENSE"
        ><img
            src="https://img.shields.io/github/license/rishi255/posh_codex?colorA=2c2837&style=for-the-badge&logo=starship style=flat-square"
            alt="License"
    /><br />
    <a href="https://github.com/rishi255/posh_codex/commits/main"
  ><img
   src="https://img.shields.io/github/last-commit/rishi255/posh_codex/main?colorA=2c2837&style=for-the-badge&logo=starship style=flat-square"
   alt="Latest commit"
    /></a>
    <a href="https://github.com/rishi255/posh_codex"
        ><img
            src="https://img.shields.io/github/repo-size/rishi255/posh_codex?colorA=2c2837&style=for-the-badge&logo=starship style=flat-square"
            alt="GitHub repository size"
    /></a>
    <a href="https://github.com/rishi255/posh_codex"
    ><img
        src="https://img.shields.io/github/workflow/status/rishi255/posh_codex/Build%20Module?colorA=2c2837&style=for-the-badge" alt="GitHub Workflow build status"></img>
    </a>
</p>

<p align="center">
    <img src='https://raw.githubusercontent.com/tom-doerr/bins/main/zsh_codex/zc4.gif'>
    <p align="center">
        You just need to write a comment or variable name and the AI will write the corresponding code.
    </p>
</p>

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
```

### 2. By cloning this repository

```powershell
# Clone the repository
git clone https://github.com/rishi255/posh_codex
cd .\posh_codex\PoshCodex\

# Install Invoke-Build module to build the module
Install-Module InvokeBuild -Force -RequiredVersion 3.2.1
Invoke-Build -File build.ps1

# Now import the built module
Import-Module .\Output\temp\PoshCodex\<version_number>\PoshCodex.psd1

# Now the module can be used.
```

## TODO checklist

- [x] Test basic PS plugin working with hardcoded completions
- [x] Test plugin by scraping the generated output from [my text-to-PowerShell OpenAI playground.](https://beta.openai.com/playground/p/4FqkeG4WQuIPfOUS6cvXQfQR?model=davinci), until a Codex API key is received.
- [x] Publish package on NuGet for testing whether all is working fine
- [x] Test NuGet package by installing and running
- [ ] Publish plugin for installation through PSGallery
- [ ] Publish plugin for installation through Scoop
- [ ] Add installation instructions to README.md
- [ ] Integrate with GitHub Actions to auto-publish new versions
- [ ] Add a way to change the hotkey for completion - currently it's `Ctrl+Alt+x`
- [ ] Test plugin robustness in PowerShell using Codex API key
- [ ] Add GIF of working demo in terminal
