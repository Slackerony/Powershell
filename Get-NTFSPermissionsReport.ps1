Function Get-NTFSPermissionsReport
{
    param
    (
        [Parameter(Mandatory)]
        [string] $Path
    )

    Get-ChildItem -Path $Path -Recurse | Get-NTFSAccess -ExcludeInherited | ForEach-Object {
        $FullName = $_.FullName.Replace($Path,'')
        [PSCustomObject]@{
            FullName = $FullName
            Account = $_.Account
            AccessRights = $_.AccessRights
            IsInherited = $_.IsInherited
        }
    }
}