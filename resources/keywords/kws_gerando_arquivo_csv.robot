*** Settings ***
Documentation    Manipulando Arquivos do Tipo CSV

Resource    ../base.robot

*** Keywords ***
Dado que é criado o arquivo CSV com os dados do CSV gerado
    Log to Console     \n==============================================================================
    Log To Console      Arquivo criado ==> ARQUIVOS_DADOS_GERADOS_CSV.csv
    Log to Console     ==============================================================================\n            
    ${ARQ_DADOS_CSV}    Set variable         ${EXECDIR}${/}resources\\arquivos\\ARQUIVOS_DADOS_GERADOS_CSV.csv
    Create File           ${ARQ_DADOS_CSV}
    Set Suite Variable    ${ARQ_DADOS_CSV}    

Quando preparo a geração do Arquivo CSV
    [Arguments]    ${UF}    ${LIN}
    Configurar Arquivo CSV    ${UF}    ${LIN}

E gravo as informações no arquivo CSV criado anteriormente
    [Arguments]    ${UF}
    Append To File      ${ARQ_DADOS_CSV}    ${NUM_CONTRATO};
    Append To File      ${ARQ_DADOS_CSV}    ${CPF_FAKE};
    Append To File      ${ARQ_DADOS_CSV}    ${UF};\n       

Então o arquivo para conferência é gerado - CSV
    E leio o arquivo gerado linha a linha com os dados do CSV
    Log to Console     ==============================================================================
    Log To Console     Dados salvos no arquivo ==> ARQUIVOS_DADOS_GERADOS_CSV.csv
    Log to Console     ==============================================================================\n        

E leio o arquivo gerado linha a linha com os dados do CSV
    [Arguments]    
    ${ARQ_DADOS_CSV_LIDO}=    Get File         ${EXECDIR}${/}resources\\arquivos\\ARQUIVOS_DADOS_GERADOS_CSV.csv
    ${ARQUIVO_CSV}=  Split To Lines    ${ARQ_DADOS_CSV_LIDO}    
    ${x}    set variable    ${0}
    FOR     ${LINHA}     IN    @{ARQUIVO_CSV}         
        ${LINHA_ARQ}=         Create List      ${LINHA}${x}           # Obtém a primeira linha do arquivo        
        ${DADOS}    Set Variable    ${LINHA_ARQ}[0]
        ${DADOS_SEPARADOS}    Split String    ${DADOS}    ;           # Separa os dados da primeira linha
        Set Test Variable      ${DADOS_SEPARADOS}
        ${CONTRATO_NUMERO}   Set Variable    ${DADOS_SEPARADOS}[0]    # Obtém o valor da primeira coluna da primeira linha        
        ${CPF_NUMERO}        Set Variable    ${DADOS_SEPARADOS}[1]    # Obtém o valor da segunda coluna da primeira linha
        ${UF_NOME}           Set Variable    ${DADOS_SEPARADOS}[2]    # Obtém o valor da terceira coluna da primeira linha

        Log to Console    ...Validando Número Contrato ==> ${CONTRATO_NUMERO}
        Log to Console    ...............Validando CPF ==> ${CPF_NUMERO}
        Log to Console    ................Validando UF ==> ${UF_NOME}\n        
        ${x}                 Set Variable     ${x+1}   
    END

