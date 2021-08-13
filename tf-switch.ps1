$version=$args[0]

if ($version -eq $null)
    {Write-Host "No version specified"}
elseif ($version -eq '?')
    {(ls -Path $env:ProgramData\chocolatey\lib | select Name | where {$_.Name -ilike "terraform*"}).Name}
else
    {Set-Content -Path $env:USERPROFILE\terraform\terraform-version.txt -Value $version}
& $profile