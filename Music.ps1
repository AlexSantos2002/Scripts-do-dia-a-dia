while ($true) {
    $url = Read-Host "Digite o link do YouTube ou 'close' para sair"
    
    if ($url -eq 'close') {
        Write-Host "Fechando o script..."
        break
    }
    
    if (-not [string]::IsNullOrEmpty($url)) {
        try {
            $desktopDir = [System.Environment]::GetFolderPath('Desktop')

            $baseDir = Join-Path $desktopDir "Musics"

            if (-not (Test-Path $baseDir)) {
                New-Item -ItemType Directory -Path $baseDir | Out-Null
            }

            yt-dlp `
                -f "bestaudio" `
                --no-post-overwrites `
                --output "$baseDir/%(uploader)s/%(title)s.%(ext)s" `
                $url

            Write-Host "Download concluido!"
        }
        catch {
            Write-Host "Ocorreu um erro ao tentar baixar o audio. Tente novamente."
        }
    } else {
        Write-Host "URL invalido. Tente novamente."
    }
}
