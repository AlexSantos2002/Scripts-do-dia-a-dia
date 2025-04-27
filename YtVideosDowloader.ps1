#Requer yt-dlp instalado (instalar via: winget install yt-dlp.yt-dlp)
#Verificação par ver se o yt-dlp está instalado
if (-not (Get-Command yt-dlp -ErrorAction SilentlyContinue)) {
    Write-Host "Instalando yt-dlp..." -ForegroundColor Yellow
    winget install yt-dlp.yt-dlp -s winget
}

#Pede o link
$videoURL = Read-Host "Cole o link do vídeo/playlist do YouTube"

#Pasta de destino
$downloadPath = [System.IO.Path]::Combine($env:USERPROFILE, "Downloads")

#Comando para fazer download na melhor qualidade
Write-Host "`nIniciando download..." -ForegroundColor Cyan
yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]" -o "$downloadPath\%(title)s.%(ext)s" $videoURL

#Resultado
Write-Host "`nDownload concluído! Verifique em: $downloadPath" -ForegroundColor Green
Read-Host "Pressione Enter para sair"