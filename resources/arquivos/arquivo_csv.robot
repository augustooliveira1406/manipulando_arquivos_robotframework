*** Settings ***
Documentation    Configurador de Arquivo do Tipo --> CSV

Resource    ../base.robot

*** Keywords ***
Configurar Arquivo CSV
    [Arguments]    ${UF}    ${LIN} 
    Log to Console     ==============================================================================
    Log To Console      Configurando Lote 2.0 csv ***${UF}*** flag1
    Log to Console     ==============================================================================\n

    ${CSV}    Set variable         ${EXECDIR}${/}resources\\arquivos\\csv\\Arquivo_CSV_${UF}.csv
    Create File       ${CSV}               
   
######HEADER
    Gerar Data
#### SE DESEJAR UTILIZAR HEADER DESCOMENTE AS LINHAS ABAIXO
    # Append To File      ${CSV}      11;
    # Append To File      ${CSV}      09109314000100;
    # Append To File      ${CSV}      Arquivo_CSV_${UF}.CSV;
    # Append To File      ${CSV}      ${DATE};
    # Append To File      ${CSV}      ${HORA_LOTE}00001;\n

#### SE NÃO DESEJAR UTILIZAR CABEÇALHOS COMENTE AS LINHAS 26 A 52        
    Append To File      ${CSV}  TIPO;
    Append To File      ${CSV}  SEQ_REG;
    Append To File      ${CSV}  CNPJ;
    Append To File      ${CSV}  EMPRESA;
    Append To File      ${CSV}  END_EMPRESA;
    Append To File      ${CSV}  NUM_EMPRESA;
    Append To File      ${CSV}  COMPL_EMPRESA;
    Append To File      ${CSV}  BAIRRO_EMPRESA;
    Append To File      ${CSV}  COD_MUNICIPIO_EMPRESA;
    Append To File      ${CSV}  CIDADE_EMPRESA;
    Append To File      ${CSV}  CEP_EMPRESA;
    Append To File      ${CSV}  UF_EMPRESA;
    Append To File      ${CSV}  TEL_EMPRESA;
    Append To File      ${CSV}  NUM_CONTRATO;
    Append To File      ${CSV}  DATA_CONTRATO;
    Append To File      ${CSV}  CPF_DEVEDOR;
    Append To File      ${CSV}  NOME_DEVEDOR;
    Append To File      ${CSV}  END_DEVEDOR;
    Append To File      ${CSV}  NUM_DEVEDOR;
    Append To File      ${CSV}  COMPL_DEVEDOR;
    Append To File      ${CSV}  BAIRO_DEVEDOR;
    Append To File      ${CSV}  COD_MUNICIPIO_DEVEDOR;
    Append To File      ${CSV}  CIDADE_DEVEDOR;
    Append To File      ${CSV}  UF_DEVEDOR;
    Append To File      ${CSV}  CEP_DEVEDOR;
    Append To File      ${CSV}  TELEFONE_DEVEDOR;
    Append To File      ${CSV}  COMENTARIO;\n

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

        Append To File      ${CSV}     12;                                #TIPO DO DETALHE
        Append To File      ${CSV}     ${SEQ_LINHA_ARQ};                  #SEQ_LINHA
        Append To File      ${CSV}     ${CNPJ_FAKE};                      #(EMPRESA) CNPJ
        Append To File      ${CSV}     ${NOME_EMPRESA_FAKE};              #(EMPRESA) NOME                
        Append To File      ${CSV}     ${ENDERECO_FAKE};                  #(EMPRESA) ENDEREÇO
        Append To File      ${CSV}     ${NUMERO_FAKE};                    #(EMPRESA) NÚMERO         
        Append To File      ${CSV}     ${COMPL_NUM_EMPRESA};              #(EMPRESA) COMPLEMENTO
        Append To File      ${CSV}     ${BAIRRO_FAKE};                    #(EMPRESA) BAIRRO          
        Append To File      ${CSV}     ${REG.CdMunicipioCredor_${UF}};    #(EMPRESA) CÓDIGO DO MUNICÍPIO
        Append To File      ${CSV}     ${CIDADE_EMPRESA_FIXO};            #(EMPRESA) NOME DO MUNICÍPIO
        Append To File      ${CSV}     ${UF};                             #(EMPRESA) UF
        Append To File      ${CSV}     ${REG.DsCEPCredor_${UF}};          #(EMPRESA) CEP        
        Append To File      ${CSV}     ${TELEFONE_EMPRESA};               #(EMPRESA) DDD + TELEFONE
                
        Append To File      ${CSV}     ${NUM_CONTRATO};                   #(EMPRESA) NÚMERO DO CONTRATO
        Append To File      ${CSV}     ${DATE};                           #(EMPRESA) DATA DO CONTRATO        
        Append To File      ${CSV}     ${CPF_FAKE};                       #(DEVEDOR) CPF/CNPJ
        Append To File      ${CSV}     ${NOME_DEVEDOR};                   #(DEVEDOR) NOME
        Append To File      ${CSV}     ${ENDERECO_DEV_FAKE};              #(DEVEDOR) ENDEREÇO
        Append To File      ${CSV}     ${NUMERO_ENDERECO_DEVEDOR};        #(DEVEDOR) NUMERO
        Append To File      ${CSV}     ${SPACE * 3};                      #(DEVEDOR) COMPL
        Append To File      ${CSV}     ${BAIRRO_DEV_FAKE};                #(DEVEDOR) BAIRRO        
        Append To File      ${CSV}     ${REG.CdMunicipioCredor_${UF}};    #(DEVEDOR) COD MUNICIPIO
        Append To File      ${CSV}     ${CIDADE_DEVEDOR_FIXO};            #(DEVEDOR) MUNICÍPIO
        Append To File      ${CSV}     ${UF};                             #(DEVEDOR) UF
        Append To File      ${CSV}     ${REG.DsCEPDevedor_${UF}};         #(DEVEDOR) CEP
        Append To File      ${CSV}     ${TELEFONE_DEVEDOR};               #(DEVEDOR) DDD + TELEFONE
        Append To File      ${CSV}     DADOS GERADOS VIA ROBOT FRAMEWORK;\n  #COMENTÁRIO
        E gravo as informações no arquivo CSV criado anteriormente    ${UF}        
        ${x}                 Set Variable     ${x+1}                
    END

    Log to Console     ==============================================================================
    Log To Console     Arquivo CSV ${UF} criado corretamente
    Log to Console     ==============================================================================\n
