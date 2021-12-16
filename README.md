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

## TODO checklist

- [x] Test basic PS plugin working with hardcoded completions
- [x] Test plugin by scraping the generated output from [my text-to-PowerShell OpenAI playground.](https://beta.openai.com/playground/p/4FqkeG4WQuIPfOUS6cvXQfQR?model=davinci), until a Codex API key is received.
- [x] Publish package on NuGet for testing whether all is working fine
- [ ] Test NuGet package by installing and running
- [ ] Publish plugin for installation through PSGallery
- [ ] Publish plugin for installation through Scoop
- [ ] Add installation instructions to README.md
- [ ] Integrate with GitHub Actions to auto-publish new versions
- [ ] Add a way to change the hotkey for completion - currently it's `Ctrl+Alt+x`
- [ ] Test plugin robustness in PowerShell using Codex API key
- [ ] Add GIF of working demo in terminal

<!-- 1. Install the OpenAI package.

pip3 install openai
```

2. Download the posh plugin.

```
    $ git clone https://github.com/rishi255/posh_codex.git ~/.oh-my-posh/custom/plugins/
```

3. Add the following to your `.poshrc` file.

Using oh-my-posh:

```
    plugins=(posh_codex)
    bindkey '^X' create_completion
```

Without oh-my-posh:

```
    # in your/custom/path you need to have a "plugins" folder and in there you clone the repository as posh_codex
    export posh_CUSTOM="your/custom/path"
    source "$posh_CUSTOM/plugins/posh_codex/posh_codex.plugin.posh"
    bindkey '^X' create_completion
```

4. Create a file called `openaiapirc` in `~/.config` with your ORGANIZATION_ID and SECRET_KEY.

```
[openai]
organization_id = ...
secret_key = ...
```

5. Run `posh`, start typing and complete it using `^X`!

## Troubleshooting

### Unhandled ZLE widget 'create_completion'

```
posh-syntax-highlighting: unhandled ZLE widget 'create_completion'
posh-syntax-highlighting: (This is sometimes caused by doing `bindkey <keys> create_completion` without creating the 'create_completion' widget with `zle -N` or `zle -C`.)
```

Add the line

```
zle -N create_completion
```

before you call `bindkey` but after loading the plugin (`plugins=(posh_codex)`).

### Already exists and is not an empty directory

```
fatal: destination path '~.oh-my-posh/custom/plugins'
```

Try to download the posh plugin again.

```
git clone https://github.com/rishi255/posh_codex.git ~/.oh-my-posh/custom/plugins/posh_codex
``` -->
