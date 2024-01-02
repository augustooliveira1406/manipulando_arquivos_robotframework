## Manipulando Aquivos com RobotFramework
Manipulando arquivos: TXT, CSV, XLSX e JSON
Utilizando o Robot Framework

## Pré-requisitos

Antes de começar, garanta que os seguintes sistemas estejam instalados em seu computador.

- [git](https://git-scm.com/) (utilizei a versão `2.43.1`)
- [Robot Framework](https://robotframework.org/?tab=1#getting-started) (utilizei a versão `6.1.1`)
- [Python](https://www.python.org/downloads/) (utulizei a versão `3.10.1`)
- [Visual Studio Code](https://code.visualstudio.com/) (estou usando a versão `1.85.1`) ou alguma outra IDE de sua preferência

> **Obs.:** Recomendo utilizar as mesmas versões, ou versões mais recentes dos sistemas listados acima.
___
## Bibliotecas 📖
As bibliotecas necessárias para utlizar no projeto estão no arquivio ./resources/base.robot
> **Obs.:** Utilizar as bibliotecas mais recentes possíveis

## Relação dos arquivos  📜
### Arquivos de uso geral

    ---> gerando_arquivos.robot          ### arquivo gerador dos arquivos de saída necessário    
    ---> kws_gerando_variaveis.robot     ### arquivo gerados de variáveis
    ---> register.yml                    ### arquivo onde consta as variáveis fixas
    ---> tabela_municipios.xlsx          ### arquivo com os códigos dos municpios do brasil conforme IBGE
    ---> arquivo.py                      ### reponsável pelas manipulações em python 

### CSV
    ----> kws_gerando_arquivo_csv.robot
    ----> arquivo_csv.robot

### TXT           
    ----> kws_gerando_arquivo_json.robot
    ----> arquivo_json.robot
> **Obs.:** Neste modelo é possível gerar o arquivo em BASE64

### JSON           
    ----> kws_gerando_arquivo_txt.robot
    ----> arquivo_txt.robot

### XLSX           
    ----> kws_gerando_arquivo_xlsx.robot
    ----> arquivo_xlsx.robot

## Repositório dos arquivos gerados   💾
Os arquivos gerados por cada tipo fica em cada pasta específica

Ex.: arquivos do tipo .txt estarão na pasta  -->  ./resources/arquivos/txt 
_____

This project was created with 💛 by [Augusto Oliveira] - 2023

email: augustooliveira1406@gmail.com
