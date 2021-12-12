#!pwsh

# This powershell plugin reads the text from the current buffer and uses a Python script to complete the text.

function Write-Completion {
    # read text from current buffer
    $BUFFER = $Host.UI.RawUI.ReadLine()
    $completion = Write-Output -n "$text" | python ./create_completion.py
    # Add completion to the current buffer.
    $BUFFER = $BUFFER + $completion
    # Write the buffer to the console.
    Write-Output "BUFFER: " $BUFFER
    # Put the cursor at the end of the line.
    $Host.UI.RawUI.CursorPosition.X = $Host.UI.RawUI.CursorPosition.X + $completion.Length
}

function Invoke-Completion {
    $BUFFER = $null
    $cursor = $null
    # read text from current buffer
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$BUFFER, [ref]$cursor)
    # [Microsoft.PowerShell.PSConsoleReadLine]::AddToHistory($line)
    # [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()

    # If the buffer text itself contains double quotes, then we need to escape them.
    $BUFFER = $BUFFER.Replace('"', '""')
    # Write-Host "BUFFER: '$BUFFER'"

    $completion = Write-Output -n "$BUFFER" | python $PSScriptRoot/create_completion.py
    # $completion = python $PSScriptRoot/create_completion.py "$BUFFER"
    # Add completion to the current buffer.
    # $BUFFER = $BUFFER + $completion
    # Write the buffer to the console.
    # Put the cursor at the end of the line.
    # $Host.UI.RawUI.CursorPosition.X = $Host.UI.RawUI.CursorPosition.X + $completion.Length

    # Write-Host "\nBUFFER: " $BUFFER
    # Write-Host "Completion: '$completion'"
    return $completion
}

Set-PSReadLineKeyHandler -Chord "Ctrl+Alt+x" `
    -BriefDescription Invoke-Completion `
    -LongDescription "Autocomplete the stuff" `
    -ScriptBlock { 
    Write-Debug "\nInvoke-Completion working..."
    $completion = Invoke-Completion 

    # Simulate a press of the Enter key. This will cause the command to be executed.
    [Microsoft.PowerShell.PSConsoleReadLine]::InsertLineBelow();
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert($completion)
    # Write-Host "$completion\n"
}

