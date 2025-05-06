$diretorio = "C:\Users\Public"
$nomeParcial = "*relatorio*"
$extensao = "*.pdf"
$diasAtras = 30

Write-Host "`nProcurando ficheiros em: $diretorio" -ForegroundColor Cyan

$ficheiros = Get-ChildItem -Path $diretorio -Recurse -File `
    -Include $extensao `
    -Filter $nomeParcial `
    | Where-Object { $_.LastWriteTime -gt (Get-Date).AddDays(-$diasAtras) }

if ($ficheiros.Count -eq 0) {
    Write-Host "Nenhum ficheiro encontrado com os critérios especificados." -ForegroundColor Yellow
} else {
    Write-Host "`nFicheiros encontrados:`n" -ForegroundColor Green
    $ficheiros | Select-Object FullName, LastWriteTime | Format-Table -AutoSize
}