function Get-AllGitStatus
{
    param
    (
        [string] $Path = (Get-Location)
    )

    Get-ChildItem -Path $Path -Directory | ForEach-Object {
        Get-GitStatus -gitDir $_
    }


}