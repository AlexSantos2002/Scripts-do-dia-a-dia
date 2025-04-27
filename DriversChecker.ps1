#Nome do arquivo de saída para o relatório
$reportFile = "c:\Users\alexa\Downloads\relatorio_drivers.csv"

#Lista de todos os drivers instalados no sistema
$drivers = Get-WmiObject Win32_PnPSignedDriver | Select-Object DeviceName, DriverVersion, DriverDate, Status, DeviceID

#Data de referência para comparação
$referenceDate = (Get-Date).AddYears(-1)

#Criação de um objeto de tabela
$formattedDrivers = $drivers | Select-Object @{Name="Nome do Dispositivo";Expression={$_.DeviceName}},
                                            @{Name="Versão do Driver";Expression={$_.DriverVersion}},
                                            @{Name="Data do Driver";Expression={$_.DriverDate}},
                                            @{Name="Status do Driver";Expression={$_.Status}},
                                            @{Name="ID do Dispositivo";Expression={$_.DeviceID}},
                                            @{Name="Status de Atualização";Expression={
                                                #Verifica se a data do driver é mais recente que a data de referência
                                                if ($_.DriverDate -gt $referenceDate) {
                                                    "ATUALIZADO"
                                                } else {
                                                    "DESATUALIZADO"
                                                }
                                            }}

#Exporta os dados formatados para um arquivo CSV
$formattedDrivers | Export-Csv -Path $reportFile -NoTypeInformation -Encoding UTF8

#Mensagem informando onde o relatório foi salvo
Write-Host "Relatório CSV gerado em: $reportFile" -ForegroundColor Green
