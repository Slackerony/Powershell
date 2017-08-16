function Get-AllGitStatus
{
    param
    (
        [string] $Path = (Get-Location)
    )

    Get-ChildItem -Path $Path -Directory | ForEach-Object {
        Set-Location -Path $_.FullName
        $status = Get-GitStatus

        [PSCustomObject]@{
            Name        = $_
            Untracked   = $status.HasUntracked
            UnCommitted = $status.HasIndex
            UnPushed    = ($status.AheadBy -gt 0)
        }
    }

    Set-Location -Path $Path

}