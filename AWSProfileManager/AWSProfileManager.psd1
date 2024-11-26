@{
    RootModule = 'AWSProfileManager.psm1'
    ModuleVersion = '0.0.1'
    GUID = 'cffa8901-2f1c-4b8e-b9a4-88f88036de77'
    Author = 'Zoltán Magyar'
    Description = 'A PowerShell module for managing AWS profiles'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Set-AWSProfile', 'Get-AWSProfile')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @('Get-AWSProfiles')
    PrivateData = @{
        PSData = @{
            Tags = @('AWS', 'CLI', 'Profile', 'Management')
            ProjectUri = 'https://github.com/zoltan-magyar/aws-profile-manager-ps'
            LicenseUri = 'https://github.com/zoltan-magyar/aws-profile-manager-ps/blob/main/LICENSE.md'
        }
    }
}
