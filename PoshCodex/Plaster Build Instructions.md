# PoshCodex

---

Copilot for your PowerShell terminal.

## Build Instructions for Developers

This module can be loaded as-is by importing PoshCodex.psd1. This is mainly intended for development purposes.

To speed up module load time and minimize the amount of files that needs to be signed, distributed and installed, this module contains a build script that will package up the module into three files:

- PoshCodex.psd1
- PoshCodex.psm1
- license.txt

To build the module, make sure you have the following pre-req modules:

- Pester (Required Version 4.1.1)
- InvokeBuild (Required Version 3.2.1)
- PowerShellGet (Required Version 1.6.0)
- ModuleBuilder (Required Version 1.0.0)

```powershell
Install-Module Pester -Force -RequiredVersion 4.1.1 -SkipPublisherCheck
Install-Module InvokeBuild -Force -RequiredVersion 3.2.1
Install-Module PowerShellGet -Force -RequiredVersion 1.6.0
Install-Module ModuleBuilder -Force -RequiredVersion 1.0.0
```

Start the build by running the following command from the project root:

```powershell
Invoke-Build
```

This will package all code into files located in `.\bin\PoshCodex`. That folder is now ready to be installed, copy to any path listed in you PSModulePath environment variable and you are good to go!

## NuGet publish instructions

NuGet is being used to publish the module for testing, if all goes well then the module can be published to PSGallery.

As mentioned [here](https://docs.microsoft.com/en-us/powershell/scripting/gallery/concepts/publishing-guidelines?view=powershell-7.2), setting up an internal Nuget repository will require more work to set up, but will have **the advantage of validating a few more of the requirements, notably validating use of an API key, and whether or not dependencies are present in the target when you publish.**

[Using NuGet to publish a package on your GitHub repo is described here.](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-nuget-registry)

Assuming nuget.config exists in posh_codex directory after cloning, run:

```powershell
dotnet new console --name PoshCodex # (only first time while publishing to NuGet)
cd ./PoshCodex

# Now, modify PoshCodex.csproj, add the following under PropertyGroup:
# <RepositoryUrl>
#     https://github.com/rishi255/posh_codex
# </RepositoryUrl>

dotnet pack --configuration Release
dotnet nuget push ".\bin\Release\PoshCodex.1.0.0.nupkg" --api-key=YOUR_GITHUB_PERSONAL_ACCESS_TOKEN
```

Maintained by Rishikesh Rachchh
