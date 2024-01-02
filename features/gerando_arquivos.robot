*** Settings  ***
Documentation     Manipulando Arquivos - JSON-TXT-XLS-CSV

Resource    ../resources/base.robot

# Test Setup       Open Session
# Test Teardown    Close Session

*** Variables ***
@{VARIAS_UFS}=     AC    AL    #AM    AP    BA    DF    CE    ES    GO
# ...    MA    MG    MS    MT    PA    PE    PI    PB    PR
# ...    RJ    RN    RO    RS    RR    SC    SE    SP    TO
 
#AC    AL    AP    BA    CE    ES    GO    MA
#MG    MS    MT    PA    PE    PI    PB    PR
#RJ    RN    RO    RR    SC    SE    SP    TO

######################################################################
#### Parar enviar o log do terminal para um arquivo txt bastar    ####
####  colocar o comando após a extensão .robot do arquivo enviado ####
#### > resources\Evidencias\Log.txt                               ####
######################################################################

*** Test Cases ***
Cenario: Validar Manipular Arquivos do tipo JSON
#robot -d .logs -i JSON features\gerando_arquivo.robot
    [Tags]    JSON
    Dado que é criado o arquivo com os dados gerados para serem utilizados posteriormente
    FOR              ${UF}              IN          @{VARIAS_UFS}  
        Set Suite Variable  ${UF}
        Quando preparo a geração do Arquivo JSON    ${UF}     
        Então o arquivo para conferência é gerado - JSON
    END

Cenario: Validar Manipular Arquivos do tipo TXT
#robot -d .logs -i TXTN features\gerando_arquivo.robot
    [Tags]    TXT
    Dado que é criado o arquivo CSV com os dados do TXT gerado
    ${REGISTROS}                       split string               ${LIN}      ,
    FOR              ${UF}              IN          @{VARIAS_UFS}  
        Set Suite Variable  ${UF}
        Set Suite Variable  ${LIN}
        Quando preparo a geração do Arquivo TXT    ${UF}    ${LIN}
        Então o arquivo para conferência é gerado - TXT
        E converto o arquivo gerado para Base64    ${UF}
    END

Cenario: Validar Manipular Arquivos do tipo XLSX
#robot -d .logs -i XLS features\gerando_arquivo.robot
    [Tags]    XLS
    Dado que é criado o arquivo CSV com os dados do XLSX gerado
    ${REGISTROS}                       split string               ${LIN}      ,
    FOR              ${UF}              IN          @{VARIAS_UFS}  
        Set Suite Variable  ${UF}
        Set Suite Variable  ${LIN}
        Quando preparo a geração do Arquivo XLSX    ${UF}    ${LIN}
        Então o arquivo para conferência é gerado - XLSX
    END        

Cenario: Validar Manipular Arquivos do tipo CSV
#robot -d .logs -i CSV features\gerando_arquivo.robot
    [Tags]    CSV
    Dado que é criado o arquivo CSV com os dados do CSV gerado
    ${REGISTROS}                       split string               ${LIN}      ,
    FOR              ${UF}              IN          @{VARIAS_UFS}  
        Set Suite Variable  ${UF}
        Set Suite Variable  ${LIN}
        Quando preparo a geração do Arquivo CSV    ${UF}    ${LIN}
        Então o arquivo para conferência é gerado - CSV
    END         