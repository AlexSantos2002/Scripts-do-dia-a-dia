#Limpeza de Arquivos Temporários (Firefox + Windows)

Clear-Host
Write-Host "=== LIMPEZA DE ARQUIVOS TEMPORÁRIOS ===" -ForegroundColor Cyan

#Limpar Temp do Sistema e do Usuário
Write-Host "Limpando pastas Temp..." -ForegroundColor Yellow
Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue

#Limpar Cache do Firefox
Write-Host "Limpando cache do Firefox..." -ForegroundColor Yellow
$firefoxProfiles = "$env:APPDATA\Mozilla\Firefox\Profiles"
if (Test-Path $firefoxProfiles) {
    Get-ChildItem -Path $firefoxProfiles -Directory | ForEach-Object {
        Remove-Item -Path "$_\cache2\*" -Recurse -Force -ErrorAction SilentlyContinue
        Remove-Item -Path "$_\thumbnails\*" -Recurse -Force -ErrorAction SilentlyContinue
    }
}

#Limpar Downloads
Write-Host "Limpando pasta Downloads..." -ForegroundColor Yellow
Remove-Item -Path "$env:USERPROFILE\Downloads\*" -Recurse -Force -ErrorAction SilentlyContinue

#Limpar reciclagem
Write-Host "Esvaziando Lixeira..." -ForegroundColor Yellow
Clear-RecycleBin -Force -ErrorAction SilentlyContinue

#Limpar Arquivos Recentes
Write-Host "Limpando histórico de arquivos recentes..." -ForegroundColor Yellow
Remove-Item -Path "$env:APPDATA\Microsoft\Windows\Recent\*" -Recurse -Force -ErrorAction SilentlyContinue

#Dados finais
Write-Host "`n=== LIMPEZA CONCLUÍDA! ===" -ForegroundColor Green
Write-Host "Espaço liberado com sucesso." -ForegroundColor White
Read-Host "Pressione Enter para sair..."