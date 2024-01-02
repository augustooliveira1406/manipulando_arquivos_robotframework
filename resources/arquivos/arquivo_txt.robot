*** Settings ***
Documentation    Configurador de Arquivo do Tipo --> TXT Colunado

Resource    ../base.robot

*** Keywords ***
Configurar Arquivo TXT
    [Arguments]    ${UF}    ${LIN}
    Log to Console     ==============================================================================
    Log To Console      Configurando arquivo TXT - Colunado
    Log to Console     ==============================================================================\n        
    
    ${TXT}    Set variable         ${EXECDIR}${/}resources\\arquivos\\txt\\Arquivo_TXT_${UF}.txt
    Create File       ${TXT}
    
######HEADER    
    Gerar Data
    Append To File      ${TXT}      11                           #FIXO
    Append To File      ${TXT}      09109314000100               #CNPJ DA EMPRESA normalmente é fixo para a empresa
    Append To File      ${TXT}      ${SPACE * 10}           
    Append To File      ${TXT}      Arquivo_TXT_${UF}.txt        #NOME DO ARQUIVO
    Append To File      ${TXT}      ${SPACE * 22}    
    Append To File      ${TXT}      ${DATE}
    Append To File      ${TXT}      ${HORA_LOTE}00001\n          #HORA TIPO DO LOTE      

######DETALHE    
    ${x}    set variable    ${0}
    FOR     ${i}      IN RANGE    0    ${LIN}
        ${SEQ} =       Evaluate     ${i} + 1 
        ${NUM_LINHAS}=     Gerar Contador Linhas Arq    ${SEQ}
        Set Test Variable       ${SEQ_LINHA_ARQ}      ${NUM_LINHAS}   
        Gerar Nome Empresa
        Gerar CNPJ
        Gerar Endereço Empresa
        Gerar Número Empresa
        Gerar Complemento Endereço Empresa
        Gerar Bairro Empresa
        Gerar Cidade Empresa      ${UF}
        Gerar Telefone Empresa    ${UF}  
        Gerar Número Contrato
        Gerar Nome e Email Devedor
        Gerar CPF       
        Gerar Endereço Devedor
        Gerar Número Endereço Devedor
        Gerar Bairro Devedor
        Gerar Cidade Devedor      ${UF}
        Gerar Telefone Devedor    ${UF}

        Append To File      ${TXT}     12                                #TIPO DO DETALHE
        Append To File      ${TXT}     ${SEQ_LINHA_ARQ}                  #SEQ_LINHA
        Append To File      ${TXT}     ${NOME_EMPRESA}                   #(EMPRESA) NOME        
        Append To File      ${TXT}     ${CNPJ_FAKE}                      #(EMPRESA) CNPJ
        Append To File      ${TXT}     ${ENDERECO_EMPRESA}               #(EMPRESA) ENDEREÇO
        Append To File      ${TXT}     ${NUMERO_FAKE}                    #(EMPRESA) NÚMERO 
        Append To File      ${TXT}     ${SPACE * 6}
        Append To File      ${TXT}     ${COMPL_NUM_EMPRESA}              #(EMPRESA) COMPLEMENTO
        Append To File      ${TXT}     ${SPACE * 13}        
        Append To File      ${TXT}     ${BAIRRO_EMPRESA}                 #(EMPRESA) BAIRRO          
        Append To File      ${TXT}     ${REG.CdMunicipioCredor_${UF}}    #(EMPRESA) CÓDIGO DO MUNICÍPIO
        Append To File      ${TXT}     ${CIDADE_EMPRESA}                 #(EMPRESA) NOME DO MUNICÍPIO
        Append To File      ${TXT}     ${UF}                             #(EMPRESA) UF
        Append To File      ${TXT}     ${REG.DsCEPCredor_${UF}}          #(EMPRESA) CEP
        Append To File      ${TXT}     ${SPACE * 2}
        Append To File      ${TXT}     ${TELEFONE_EMPRESA}               #(EMPRESA) DDD + TELEFONE
        Append To File      ${TXT}     ${SPACE * 4}          
                
        Append To File      ${TXT}     ${NUM_CONTRATO}                   #(EMPRESA) NÚMERO DO CONTRATO
        Append To File      ${TXT}     ${SPACE * 9}       
        Append To File      ${TXT}     ${DATE}                           #(EMPRESA) DATA DO CONTRATO
        
        Append To File      ${TXT}     ${CPF_FAKE}                       #(DEVEDOR) CPF/CNPJ
        Append To File      ${TXT}     ${NOME_DEVEDOR_FAKE}              #(DEVEDOR) NOME
        Append To File      ${TXT}     ${ENDERECO_DEVEDOR}               #(DEVEDOR) ENDEREÇO
        Append To File      ${TXT}     ${NUMERO_ENDERECO_DEVEDOR}        #(DEVEDOR) NUMERO
        Append To File      ${TXT}     ${SPACE * 1}
        Append To File      ${TXT}     ${SPACE * 2}
        Append To File      ${TXT}     ${BAIRRO_DEVEDOR}                 #(DEVEDOR) BAIRRO        
        Append To File      ${TXT}     ${REG.CdMunicipioCredor_${UF}}    #(DEVEDOR) COD MUNICIPIO
        Append To File      ${TXT}     ${CIDADE_DEVEDOR}                 #(DEVEDOR) MUNICÍPIO
        Append To File      ${TXT}     ${UF}                             #(DEVEDOR) UF
        Append To File      ${TXT}     ${REG.DsCEPDevedor_${UF}}         #(DEVEDOR) CEP
        Append To File      ${TXT}     ${SPACE * 2}
        Append To File      ${TXT}     ${TELEFONE_DEVEDOR}               #(DEVEDOR) DDD + TELEFONE
        Append To File      ${TXT}     ${SPACE * 9}
        Append To File      ${TXT}     DADOS GERADOS VIA ROBOT FRAMEWORK  #COMENTÁRIO
        Append To File      ${TXT}     ${SPACE * 97}\n 
        E gravo as informações no arquivo TXT criado anteriormente    ${UF}        
        ${x}                 Set Variable     ${x+1}                
    END

#### TRAILLER    
    ${LINHAS} =       Evaluate     ${LIN} + 2    
    ${NUM_LINHAS}=     Gerar Contador Linhas          ${LINHAS}
    Set Variable       ${NUM_LINHAS}      ${NUMLINHAS}
    Append To File     ${TXT}     13${NUM_LINHAS}\n
####    

    Log to Console     ==============================================================================
    Log To Console     Arquivo txt ${UF} criado corretamente
    Log to Console     ==============================================================================\n
