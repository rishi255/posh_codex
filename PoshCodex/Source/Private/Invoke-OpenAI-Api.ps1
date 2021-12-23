function Invoke-OpenAI-Api {
    [CmdletBinding()]
    param (
        $BUFFER
    )

    # [Microsoft.PowerShell.PSConsoleReadLine]::AddToHistory($line)
    # [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()

    $data = @{
        prompt            = "#!/usr/bin/env powershell\n\n" + $BUFFER
        max_tokens        = 64
        temperature       = 0.3
        frequency_penalty = 0.0
        presence_penalty  = 0.0
    }

    $json_output = Invoke-RestMethod "https://api.openai.com/v1/engines/davinci-instruct-beta-v3/completions" `
        -Body (ConvertTo-Json $data) `
        -ContentType "application/json" `
        -Authentication Bearer `
        -Token  ( ConvertTo-SecureString -String $env:OPENAI_API_KEY -AsPlainText) `
        -Method POST

    return $json_output
}