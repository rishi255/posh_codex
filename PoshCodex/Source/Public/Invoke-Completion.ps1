#Requires -Modules PSReadLine

function Invoke-Completion {
    # Add cmdletBinding to the parameter list
    [CmdletBinding()]
    param()

    #? If $env:OPENAI_API_KEY is not set, then print message and exit.
    if ($null -eq $env:OPENAI_API_KEY) {        
        # Write the error output to console without using Write-Color module
        $error_message = "`n`$env:OPENAI_API_KEY is not set! Please set it using the following command:`n`$env:OPENAI_API_KEY = `"YOUR_API_KEY`"`nThen, restart the shell and try again.`n"
        Write-Host "$error_message" -ForegroundColor Red
        return
    }

    $BUFFER = $null
    $cursor = $null

    # read text from current buffer
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$BUFFER, [ref]$cursor)

    # If the buffer text itself contains double quotes, then we need to escape them.
    $BUFFER = $BUFFER.Replace('"', '""')

    $json_output = Invoke-OpenAI-Api $BUFFER

    # check if json_output is not equal to null
    if ($null -ne $json_output) {
        $completion = $json_output.choices[0].text

        # Insert the completion on the next line. This will NOT cause the command to be executed.
        [Microsoft.PowerShell.PSConsoleReadLine]::InsertLineBelow();
        [Microsoft.PowerShell.PSConsoleReadLine]::Insert($completion)
    }
    else {
        Write-Host "Response returned by OpenAI API is null! It could be an internal error or an issue with your API key. Please check your API key and try again." -ForegroundColor Red
    }

    <#
        .SYNOPSIS
        Adds a file name extension to a supplied name.

        .DESCRIPTION
        Adds a file name extension to a supplied name.
        Takes any strings for the file name or extension.

        .PARAMETER Name
        Specifies the file name.

        .PARAMETER Extension
        Specifies the extension. "Txt" is the default.

        .INPUTS
        None. You cannot pipe objects to Add-Extension.

        .OUTPUTS
        System.String. Add-Extension returns a string with the extension or file name.

        .EXAMPLE
        PS> extension -name "File"
        File.txt

        .EXAMPLE
        PS> extension -name "File" -extension "doc"
        File.doc

        .EXAMPLE
        PS> extension "File" "doc"
        File.doc

        .LINK
        Online version: http://www.fabrikam.com/extension.html

        .LINK
        Set-Item
    #>
}

# TODO: Add a way to make this key handler dynamically assigned (i.e. user can assign the keybind).
Set-PSReadLineKeyHandler -Chord "Ctrl+Alt+x" `
    -BriefDescription Invoke-Completion `
    -LongDescription "Autocomplete the stuff" `
    -ScriptBlock { Invoke-Completion }

# Export-ModuleMember -ModuleDefinition $PSModuleInfo -MemberType Function -Name Invoke-Completion -Function Invoke-Completion