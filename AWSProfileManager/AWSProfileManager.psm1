. $PSScriptRoot\Public\Set-AWSProfile.ps1
. $PSScriptRoot\Public\Get-AWSProfile.ps1

New-Alias -Name Get-AWSProfiles -Value Get-AWSProfile

Register-ArgumentCompleter -CommandName Set-AWSProfile -ParameterName ProfileName -ScriptBlock {
    param(
        $commandName,
        $parameterName,
        $wordToComplete,
        $commandAst,
        $fakeBoundParameters
    )

    $awsCredsPath = Join-Path $HOME '.aws\credentials'
    if (Test-Path $awsCredsPath) {
        Get-Content $awsCredsPath |
            Select-String '^\[(.+)\]$' |
            ForEach-Object { $_.Matches.Groups[1].Value } |
            Where-Object { $_ -like "$wordToComplete*" } |
            ForEach-Object {
                [System.Management.Automation.CompletionResult]::new(
                    $_,
                    $_,
                    'ParameterValue',
                    $_
                )
            }
    }
}

Export-ModuleMember -Function Set-AWSProfile, Get-AWSProfile -Alias Get-AWSProfiles
