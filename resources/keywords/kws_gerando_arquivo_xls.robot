*** Settings ***
Documentation    Manipulando Arquivos do Tipo TXT

Resource    ../base.robot

*** Keywords ***
Dado que é criado o arquivo CSV com os dados do XLSX gerado
    Log to Console     \n==============================================================================
    Log To Console      Arquivo criado ==> ARQUIVOS_DADOS_GERADOS_XLSX.csv
    Log to Console     ==============================================================================\n            
    ${ARQ_DADOS_XLS}    Set variable         ${EXECDIR}${/}resources\\arquivos\\ARQUIVOS_DADOS_GERADOS_XLSX.csv
    Create File           ${ARQ_DADOS_XLS}
    Set Suite Variable    ${ARQ_DADOS_XLS}    

Quando preparo a geração do Arquivo XLSX
    [Arguments]    ${UF}    ${LIN}
    Configurar Arquivo XLSX    ${UF}    ${LIN}

E gravo as informações no arquivo XLSX criado anteriormente
    [Arguments]    ${UF}
    Append To File      ${ARQ_DADOS_XLS}    ${NUM_CONTRATO};
    Append To File      ${ARQ_DADOS_XLS}    ${CPF_FAKE};
    Append To File      ${ARQ_DADOS_XLS}    ${UF};\n       

Então o arquivo para conferência é gerado - XLSX
    E leio o arquivo gerado linha a linha com os dados do XLSX
    Log to Console     ==============================================================================
    Log To Console     Dados salvos no arquivo ==> ARQUIVOS_DADOS_GERADOS_XLSX.csv
    Log to Console     ==============================================================================\n        

E leio o arquivo gerado linha a linha com os dados do XLSX
    [Arguments]    
    ${ARQ_DADOS_XLS_LIDO}=    Get File         ${EXECDIR}${/}resources\\arquivos\\ARQUIVOS_DADOS_GERADOS_XLSX.csv
    ${ARQUIVO_CSV}=  Split To Lines    ${ARQ_DADOS_XLS_LIDO}    
    ${x}    set variable    ${0}
    FOR     ${LINHA}     IN    @{ARQUIVO_CSV}         
        ${LINHA_ARQ}=         Create List      ${LINHA}${x}           # Obtém a primeira linha do arquivo        
        ${DADOS}    Set Variable    ${LINHA_ARQ}[0]
        ${DADOS_SEPARADOS}    Split String    ${DADOS}    ;           # Separa os dados da primeira linha
        Set Test Variable      ${DADOS_SEPARADOS}
        ${CONTRATO_NUMERO}   Set Variable    ${DADOS_SEPARADOS}[0]    # Obtém o valor da primeira coluna da primeira linha        
        ${CPF_NUMERO}        Set Variable    ${DADOS_SEPARADOS}[1]    # Obtém o valor da terceira coluna da primeira linha
        ${UF_NOME}           Set Variable    ${DADOS_SEPARADOS}[2]    # Obtém o valor da quarta coluna da primeira linha

        Log to Console    ...Validando Número Contrato ==> ${CONTRATO_NUMERO}
        Log to Console    ...............Validando CPF ==> ${CPF_NUMERO}
        Log to Console    ................Validando UF ==> ${UF_NOME}\n        
        ${x}                 Set Variable     ${x+1}   
    END

