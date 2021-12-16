@{
    Path = "PoshCodex.psd1"
    OutputDirectory = "..\bin\PoshCodex"
    Prefix = '.\_PrefixCode.ps1'
    SourceDirectories = 'Classes','Private','Public'
    PublicFilter = 'Public\*.ps1'
    VersionedOutputDirectory = $true
}
