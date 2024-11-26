function Set-AWSProfile {
    <#
    .SYNOPSIS
        Switches the active AWS profile.
    .DESCRIPTION
        Changes the AWS_PROFILE environment variable to use the specified profile.
    .PARAMETER ProfileName
        The name of the AWS profile to switch to. This parameter is positional and can be provided without the parameter name.
    .EXAMPLE
        Set-AWSProfile -ProfileName staging
    .EXAMPLE
        Set-AWSProfile development
    .NOTES
        Requires AWS credentials file at ~/.aws/credentials
    .LINK
        https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html#cli-configure-files-using-profiles
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true, Position = 0)]
        [string]$ProfileName
    )

    # Get AWS credentials file path
    $awsCredentialsPath = Join-Path $HOME '.aws\credentials'

    # Check if credentials file exists
    if (-not (Test-Path $awsCredentialsPath)) {
        Write-Error "AWS credentials file not found at: $awsCredentialsPath"
        return
    }

    # Check if profile exists
    $profileExists = Get-Content $awsCredentialsPath | Select-String "^\[$ProfileName\]$"
    if (-not $profileExists) {
        Write-Error "Profile '$ProfileName' not found in credentials file"
        return
    }

    # Set the AWS_PROFILE environment variable
    if ($PSCmdlet.ShouldProcess("AWS Profile", "Switch to profile '$ProfileName'")) {
        $env:AWS_PROFILE = $ProfileName
    }
}
