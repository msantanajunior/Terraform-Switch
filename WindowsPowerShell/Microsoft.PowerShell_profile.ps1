#Adicione essa função ao seu profile do PowerShell
function Set-TfEnv {
    $tfenvfile = "$($env:UserProfile)/terraform/terraform-version.txt"
    if (!(Test-Path $tfenvfile)) {
        Remove-Alias -Name terraform
        Write-Host "No terraform-version file"
        return
    }
    $terraformVersion = Get-Content -Path $tfenvfile
    #abaixo é preciso alterar o caminho de acordo com o path onde você guarda os executáveis do Terraform.
    Set-Alias -Name terraform -Value "C:\ProgramData\chocolatey\lib\terraform.$($terraformVersion)\tools\terraform.exe" -Scope Global
    Set-Alias -Name tf-switch -Value "C:\Users\m.santana.junior\terraform\tf-switch.ps1" -Scope Global
}
Set-TfEnv
