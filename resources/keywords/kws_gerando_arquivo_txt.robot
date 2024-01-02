*** Settings ***
Documentation    Manipulando Arquivos do Tipo TXT

Resource    ../base.robot

*** Keywords ***
Dado que é criado o arquivo CSV com os dados do TXT gerado
    Log to Console     \n==============================================================================
    Log To Console      Arquivo criado ==> ARQUIVOS_DADOS_GERADOS_TXT.csv
    Log to Console     ==============================================================================\n            
    ${ARQ_DADOS_TXT}    Set variable         ${EXECDIR}${/}resources\\arquivos\\ARQUIVOS_DADOS_GERADOS_TXT.csv
    Create File           ${ARQ_DADOS_TXT}
    Set Suite Variable    ${ARQ_DADOS_TXT}    

Quando preparo a geração do Arquivo TXT
    [Arguments]    ${UF}    ${LIN}
    Configurar Arquivo TXT    ${UF}    ${LIN}

E gravo as informações no arquivo TXT criado anteriormente
    [Arguments]    ${UF}
    Append To File      ${ARQ_DADOS_TXT}    ${NUM_CONTRATO};
    Append To File      ${ARQ_DADOS_TXT}    ${CPF_FAKE};
    Append To File      ${ARQ_DADOS_TXT}    ${UF};\n       

Então o arquivo para conferência é gerado - TXT
    E leio o arquivo gerado linha a linha com os dados do TXT
    Log to Console     ==============================================================================
    Log To Console     Dados salvos no arquivo ==> ARQUIVOS_DADOS_GERADOS_TXT.csv
    Log to Console     ==============================================================================\n        

E leio o arquivo gerado linha a linha com os dados do TXT
    [Arguments]    
    ${ARQ_DADOS_TXT_LIDO}=    Get File         ${EXECDIR}${/}resources\\arquivos\\ARQUIVOS_DADOS_GERADOS_TXT.csv
    ${ARQUIVO_TXT}=  Split To Lines    ${ARQ_DADOS_TXT_LIDO}    
    ${x}    set variable    ${0}
    FOR     ${LINHA}     IN    @{ARQUIVO_TXT}         
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

E converto o arquivo TXT para Base64
    [Arguments]    ${UF}
    ${ARQ_BASE64}   Set variable     ${EXECDIR}${/}resources\\arquivos\\txt\\Arquivo_TXT_${UF}.txt
    
    ${ARQ_CONVERTIDO}    Converte Arquivo Base64    ${ARQ_BASE64}
    Set Suite Variable    ${ARQ_CONVERTIDO}    

    ${ARQ_TXT_CONVERTIDO}    Set variable         ${EXECDIR}${/}resources\\arquivos\\txt\\ArqBase64_${UF}.txt  
    Create File       ${ARQ_TXT_CONVERTIDO}    
    
    Append To File    ${ARQ_TXT_CONVERTIDO}    ${ARQ_CONVERTIDO}\n   
 
    Log to Console     ==============================================================================
    Log To Console      Arquivo txt COnvertido para Base64 com sucesso    
    Log to Console     ==============================================================================\n
