class AWSProfile {
    [string]$Profile
    [bool]$Current
}

function Get-AWSProfile {
    <#
    .SYNOPSIS
        Lists all available AWS profiles and indicates the currently active profile.
    .DESCRIPTION
        Gets all AWS profiles from the credentials file located in ~/.aws/credentials
        and displays them in a list, marking which profile is currently active via
        the AWS_PROFILE environment variable.
    .OUTPUTS
    AWSProfile
        Returns array of AWSProfile objects containing:
        - Profile: The name of the AWS profile
        - Current: Boolean indicating if this is the active profile
    .EXAMPLE
        Get-AWSProfile
        Lists all AWS profiles and shows which is currently active
    .NOTES
        Requires an AWS credentials file at ~/.aws/credentials
        Uses AWS_PROFILE environment variable to determine active profile
    .LINK
        https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html#cli-configure-files-using-profiles
    #>
    [CmdletBinding()]
    [OutputType([AWSProfile])]
    param()

    # Get AWS credentials file path
    $awsCredentialsPath = Join-Path $HOME '.aws\credentials'

    # Check if credentials file exists
    if (-not (Test-Path $awsCredentialsPath)) {
        Write-Error "AWS credentials file not found at: $awsCredentialsPath"
        return
    }

    # Get all profiles
    $profiles = Get-Content $awsCredentialsPath |
        Select-String '^\[(.+)\]$' |
        ForEach-Object { $_.Matches.Groups[1].Value }

    $currentProfile = $env:AWS_PROFILE

    # Create custom objects for output
    $profiles | ForEach-Object {
        [AWSProfile]@{
            Profile = $_
            Current = ($_ -eq $currentProfile)
        }
    }
}
