<#
    Organizador Automático de Arquivos na Pasta Downloads
    Classifica arquivos em subpastas por tipo (Documentos, Imagens, Executáveis, etc.)
#>

function Organizar-Downloads {
    
    try {
        #Caminho para a pasta Downloads
        $pastaDownloads = [System.IO.Path]::Combine($env:USERPROFILE, "Downloads")

        #Estrutura de pastas
        $categorias = @{
            "Documentos"   = @(".pdf", ".docx", ".xlsx", ".pptx", ".txt", ".csv")
            "Imagens"      = @(".jpg", ".jpeg", ".png", ".gif", ".bmp", ".svg")
            "Compactados"  = @(".zip", ".rar", ".7z", ".tar.gz")
            "Executáveis"  = @(".exe", ".msi", ".bat", ".ps1")
            "Multimídia"  = @(".mp4", ".mp3", ".avi", ".mkv", ".wav")
            "Outros"       = @()
        }

        Write-Host "`n=== ORGANIZANDO DOWNLOADS ===" -ForegroundColor Cyan
        Write-Host "Pasta analisada: $pastaDownloads`n"

        #Caso não existam cria pastas de destino
        foreach ($categoria in $categorias.Keys) {
            $caminhoCompleto = [System.IO.Path]::Combine($pastaDownloads, $categoria)
            if (-not (Test-Path $caminhoCompleto)) {
                New-Item -Path $caminhoCompleto -ItemType Directory -Force | Out-Null
                Write-Host "Pasta criada: $categoria" -ForegroundColor DarkGray
            }
        }

        #Mover cada arquivo para a categoria a que corresponde
        Get-ChildItem -Path $pastaDownloads -File | ForEach-Object {
            $arquivo = $_
            $extensao = $arquivo.Extension.ToLower()
            $movido = $false

            foreach ($categoria in $categorias.GetEnumerator()) {
                if ($categoria.Value -contains $extensao) {
                    $destino = [System.IO.Path]::Combine($pastaDownloads, $categoria.Key, $arquivo.Name)
                    Move-Item -Path $arquivo.FullName -Destination $destino -Force
                    Write-Host "[$($categoria.Key.PadRight(12))] $($arquivo.Name)" -ForegroundColor DarkCyan
                    $movido = $true
                    break
                }
            }

            #Mover para outros caso não corresponda a nenhuma das categorias apresentadas
            if (-not $movido) {
                $destino = [System.IO.Path]::Combine($pastaDownloads, "Outros", $arquivo.Name)
                Move-Item -Path $arquivo.FullName -Destination $destino -Force
                Write-Host "[Outros      ] $($arquivo.Name)" -ForegroundColor DarkGray
            }
        }

        Write-Host "`n✔ Organização concluída com sucesso!" -ForegroundColor Green
    }
    catch {
        Write-Host "`n❌ Erro durante a organização:" -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Yellow
    }
}

#Executa a função principal
Organizar-Downloads

#Mantém o console aberto
Write-Host "`nPressione qualquer tecla para sair..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")