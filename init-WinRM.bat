powershell "Set-NetConnectionProfile -NetworkCategory Private"
winrm qc
winrm set winrm/config/client/auth @{Basic="true"}
winrm set winrm/config/service/auth @{Basic="true"}
winrm set winrm/config/service @{AllowUnencrypted="true"}
