# AWSProfileManager

A PowerShell module for managing AWS profiles easily.

## Installation

```powershell
Install-Module -Name AWSProfileManager -Scope CurrentUser
```

## Usage

```powershell
# List available profiles
Get-AWSProfile
# or use the alias
Get-AWSProfiles

# Switch to a specific profile
Set-AWSProfile <your-profile-name>
```

## Features

- List available AWS profiles and see which one is currently active
- Switch between AWS profiles using environment variables
- Tab completion for profile names

## Requirements

- PowerShell 5.1 or later
- AWS credentials file configured at ~/.aws/credentials

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Author

Zoltán Magyar
