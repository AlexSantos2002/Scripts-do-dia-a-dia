import os
from PyPDF2 import PdfReader

def contar_paginas_pdfs(diretorio):
    total_paginas = 0
    for arquivo in os.listdir(diretorio):
        if arquivo.lower().endswith('.pdf'):
            caminho_pdf = os.path.join(diretorio, arquivo)
            try:
                leitor = PdfReader(caminho_pdf)

                if leitor.is_encrypted:
                    try:
                        leitor.decrypt("")
                    except Exception:
                        print(f"Aviso: '{arquivo}' está protegido por senha e foi ignorado.")
                        continue

                num_paginas = len(leitor.pages)
                total_paginas += num_paginas
            except Exception:
                print(f"Aviso: '{arquivo}' está criptografado com AES ou está corrompido e foi ignorado.")
    return total_paginas

if __name__ == "__main__":
    diretorio_alvo = input("Digite o caminho da pasta com os PDFs: ").strip()

    if not os.path.isdir(diretorio_alvo):
        print("Caminho inválido. Verifique e tente novamente.")
    else:
        total = contar_paginas_pdfs(diretorio_alvo)
        print(f"\nO número total de páginas para fotocopiar é: {total}")
