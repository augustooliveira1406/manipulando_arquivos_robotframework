*** Settings ***
Documentation    Manipulando Arquivos do Tipo JSON

Resource    ../base.robot

*** Keywords ***
Dado que é criado o arquivo com os dados gerados para serem utilizados posteriormente
    Log to Console     \n==============================================================================
    Log To Console      Arquivo criado ==> ARQUIVOS_DADOS_GERADOS_JSON.csv
    Log to Console     ==============================================================================\n            
    ${ARQ_DADOS_JSON}    Set variable         ${EXECDIR}${/}resources\\arquivos\\ARQUIVOS_DADOS_GERADOS_JSON.csv
    Create File           ${ARQ_DADOS_JSON}
    Set Suite Variable    ${ARQ_DADOS_JSON}    

Quando preparo a geração do Arquivo JSON
    [Arguments]    ${UF}
    Configurar Arquivo JSON    ${UF}

E gravo as informações do arquivo JSON criado anteriormente
    [Arguments]    ${UF}
    Append To File      ${ARQ_DADOS_JSON}    ${NUM_CONTRATO};
    Append To File      ${ARQ_DADOS_JSON}    ${CPF_FAKE};
    Append To File      ${ARQ_DADOS_JSON}    ${UF};\n       

Então o arquivo para conferência é gerado - JSON    
    Log to Console     ==============================================================================
    Log To Console     Dados salvos no arquivo ==> ARQUIVOS_DADOS_GERADOS_JSON.csv
    Log to Console     ==============================================================================\n
    E leio o arquivo gerado linha a linha com os dados do JSON        

E leio o arquivo gerado linha a linha com os dados do JSON
    [Arguments]    
    ${ARQ_DADOS_JSON_LIDO}=    Get File         ${EXECDIR}${/}resources\\arquivos\\ARQUIVOS_DADOS_GERADOS_JSON.csv
    ${ARQUIVO_CSV}=  Split To Lines    ${ARQ_DADOS_JSON_LIDO}    
    ${x}    set variable    ${0}
    FOR     ${LINHA}     IN    @{ARQUIVO_CSV}         
        ${LINHA_ARQ}=         Create List      ${LINHA}${x}           # Obtém a primeira linha do arquivo        
        ${DADOS}    Set Variable    ${LINHA_ARQ}[0]
        ${DADOS_SEPARADOS}    Split String    ${DADOS}    ;           # Separa os dados da primeira linha
        Set Test Variable      ${DADOS_SEPARADOS}
        ${CONTRATO_NUMERO}   Set Variable    ${DADOS_SEPARADOS}[0]    # Obtém o valor da primeira coluna da primeira linha        
        ${CPF_NUMERO}       Set Variable    ${DADOS_SEPARADOS}[1]    # Obtém o valor da terceira coluna da primeira linha
        ${UF_NOME}           Set Variable    ${DADOS_SEPARADOS}[2]    # Obtém o valor da quarta coluna da primeira linha


        Log to Console    ...Validando Número Contrato ==> ${CONTRATO_NUMERO}
        Log to Console    ...............Validando CPF ==> ${CPF_NUMERO}
        Log to Console    ................Validando UF ==> ${UF_NOME}\n      
        ${x}                 Set Variable     ${x+1}   
    END

