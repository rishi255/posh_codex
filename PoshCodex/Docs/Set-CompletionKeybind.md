---
external help file: PoshCodex-help.xml
Module Name: PoshCodex
online version:
schema: 2.0.0
---

# Set-CompletionKeybind

## SYNOPSIS

This function is used to change the keybind that calls the Write-Completion function.

## SYNTAX

```
Set-CompletionKeybind [[-keybind] <Object>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION

Check help for the module to learn more.

PS> Get-Help PoshCodex

## EXAMPLES

### Example 1

```powershell
PS C:\> Set-CompletionKeybind 'Shift+y'
```

### Example 2

```powershell
PS C:\> Set-CompletionKeybind 'Tab'
```

### Example 3

```powershell
PS C:\> Set-CompletionKeybind 'Ctrl+K,Ctrl+E'
```

## PARAMETERS

### -keybind

{{ Fill keybind Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProgressAction

{{ Fill ProgressAction Description }}

```yaml
Type: ActionPreference
Parameter Sets: (All)
Aliases: proga

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### String (keybind to set)

## OUTPUTS

### None

## NOTES

## RELATED LINKS
