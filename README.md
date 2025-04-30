# Scripts-do-dia-a-dia

Este repositório contém uma coleção de scripts criados para automatizar tarefas cotidianas no meu computador ou para facilitar atividades específicas. Alguns scripts foram criados para poupar tempo em tarefas repetitivas, enquanto outros foram desenvolvidos apenas por curiosidade ou interesse em aprender mais sobre programação e automação.

## Objetivo

O objetivo deste repositório é fornecer um conjunto de ferramentas simples, mas úteis, para automação de diversas tarefas no sistema operacional Windows. Os scripts são desenvolvidos principalmente em PowerShell, mas podem incluir outras linguagens ou tecnologias conforme necessário.

## Scripts Disponíveis

Aqui estão alguns dos scripts disponíveis neste repositório:

### 1. **CleanPC.ps1**
   - **Descrição**: Script que deleta ficheiros temporarios e outros dispensaveis

### 2. **DriversChecker.ps1**
   - **Descrição**: Este script verifica os drivers instalados no sistema e gera um relatório em CSV ou HTML. Ele verifica também se os drivers estão atualizados, indicando se cada driver está "ATUALIZADO" ou "DESATUALIZADO" com base na data de instalação.
   - **Funcionalidade**: Verifica a versão e a data dos drivers, comparando com uma data de referência para determinar se a versão do driver está atualizada.

### 3. **DownloadFolderOrganazer.ps1**
   - **Descrição**: Organizar a pasta downloads
   - **Funcionalidade**: Analisa que ficheiros estão presentes na pasta e tendo em conta a sua extenção (.png, .exe etc) irá os organizar por pastas

### 4. **YtVideosDownloader.ps1**
   - **Descrição**: Baixar videos do youtube
   - **Funcionalidade**: Através de um link dado o script baixa o video ou playlist na melhor qualidade disponivel

### 5. **Music.ps1**
  - Descrição: Baixar áudio de vídeos do YouTube
  - Funcionalidade: Através de um link fornecido, o script baixa o áudio do vídeo do YouTube (em sua melhor qualidade disponível) e o salva na pasta Musics na área de trabalho. O script organiza o áudio nas subpastas com o nome do uploader (artista ou canal), e o arquivo será salvo com o título do vídeo. O script fica aguardando novos links até que o comando close seja inserido, encerrando o processo.