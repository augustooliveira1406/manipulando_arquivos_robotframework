*** Settings ***
Documentation    Configurador de Arquivo do Tipo --> XLSX

Resource    ../base.robot

*** Keywords ***
Configurar Arquivo XLSX
    [Arguments]    ${UF}    ${LIN}
    Remove File      ${EXECDIR}${/}resources\\arquivos\\xlsx\\*.xlsx       #Remove arquivos XLSX antes de executar o próximo teste
    ${XLS}    Set variable         ${EXECDIR}${/}resources\\arquivos\\xlsx\\Arquivo_XLS_${UF}.xlsx
    Create Excel Document   ${XLS}

######CRIANDO CABEÇALHO DO ARQUIVO EXCEL
    Create Workbook   ${XLS}
    Write To Cell  A1  CNPJ
    Write To Cell  B1  EMPRESA
    Write To Cell  C1  END_EMPRESA
    Write To Cell  D1  NUM_EMPRESA
    Write To Cell  E1  COMPL_EMPRESA
    Write To Cell  F1  BAIRRO_EMPRESA
    Write To Cell  G1  COD_MUNICIPIO_EMPRESA
    Write To Cell  H1  CIDADE_EMPRESA
    Write To Cell  I1  CEP_EMPRESA
    Write To Cell  J1  UF_EMPRESA
    Write To Cell  K1  TEL_EMPRESA
    Write To Cell  L1  NUM_CONTRATO
    Write To Cell  M1  DATA_CONTRATO
    Write To Cell  N1  CPF_DEVEDOR
    Write To Cell  O1  NOME_DEVEDOR
    Write To Cell  P1  END_DEVEDOR
    Write To Cell  Q1  NUM_DEVEDOR
    Write To Cell  R1  COMPL_DEVEDOR
    Write To Cell  S1  BAIRO_DEVEDOR
    Write To Cell  T1  COD_MUNICIPIO_DEVEDOR
    Write To Cell  U1  CIDADE_DEVEDOR
    Write To Cell  V1  UF_DEVEDOR
    Write To Cell  W1  CEP_DEVEDOR
    Write To Cell  X1  TELEFONE_DEVEDOR
    Write To Cell  Y1  COMENTARIO        
    #Save   ${XLS}

####INSENRINDO LINHAS NO ARQUIVO EXCEL GERADO    
    ${x}    set variable    ${0}
    FOR     ${i}      IN RANGE    0    ${LIN}
        ${i}      Set Variable     ${x+1}    
        Gerar Nome Empresa
        Gerar CNPJ
        Gerar Endereço Empresa
        Gerar Número Empresa
        Gerar Complemento Endereço Empresa
        Gerar Bairro Empresa
        Gerar Cidade Empresa      ${UF}
        Gerar Telefone Empresa    ${UF}
        Gerar Data  
        Gerar Número Contrato
        Gerar Nome e Email Devedor
        Gerar CPF       
        Gerar Endereço Devedor
        Gerar Número Endereço Devedor
        Gerar Bairro Devedor
        Gerar Cidade Devedor      ${UF}
        Gerar Telefone Devedor    ${UF}
        
        Write To Cell  A${i+1}  ${CNPJ_FAKE}          			   #(EMPRESA) CNPJ
        Write To Cell  B${i+1}  ${NOME_EMPRESA_FAKE}   			   #(EMPRESA) NOME
        Write To Cell  C${i+1}  ${ENDERECO_EMPRESA}                #(EMPRESA) ENDEREÇO
        Write To Cell  D${i+1}  ${NUMERO_FAKE}             		   #(EMPRESA) NÚMERO
        Write To Cell  E${i+1}  ${COMPL_NUM_EMPRESA}               #(EMPRESA) COMPL
        Write To Cell  F${i+1}  ${BAIRRO_FAKE}                     #(EMPRESA) BAIRRO
        Write To Cell  G${i+1}  ${REG.CdMunicipioCredor_${UF}}     #(EMPRESA) CÓDIGO DO MUNICÍPIO
        Write To Cell  H${i+1}  ${CIDADE_EMPRESA}                  #(EMPRESA) MUNICÍPIO
        Write To Cell  I${i+1}  ${UF}            			       #(EMPRESA) UF
        Write To Cell  J${i+1}  ${REG.DsCEPCredor_${UF}}           #(EMPRESA) CEP
        Write To Cell  K${i+1}  ${TELEFONE_EMPRESA} 			   #(EMPRESA) TELEFONE
        Write To Cell  L${i+1}  ${NUM_CONTRATO}     			   #(EMPRESA) NÚMERO CONTRATO
        Write To Cell  M${i+1}  ${DATA_FORMATADA}            	   #(EMPRESA) DATA
        Write To Cell  N${i+1}  ${CPF_FAKE}       			       #(DEVEDOR) CPF
        Write To Cell  O${i+1}  ${NOME_DEVEDOR_FAKE}               #(DEVEDOR) NOME
        Write To Cell  P${i+1}  ${ENDERECO_DEV_FAKE}               #(DEVEDOR) ENDEREÇO
        Write To Cell  Q${i+1}  ${NUMERO_ENDERECO_DEVEDOR}         #(DEVEDOR) NUMERO
        Write To Cell  R${i+1}  ${SPACE * 5}                       #(DEVEDOR) COMPL
        Write To Cell  S${i+1}  ${BAIRRO_DEV_FAKE}                 #(DEVEDOR) BAIRRO
        Write To Cell  T${i+1}  ${REG.CdMunicipioCredor_${UF}}     #(DEVEDOR) CÓDIGO DO MUNICÍPIO
        Write To Cell  U${i+1}  ${CIDADE_DEVEDOR}                  #(DEVEDOR) MUNICÍPIO
        Write To Cell  V${i+1}  ${UF}                              #(DEVEDOR) UF
        Write To Cell  W${i+1}  ${REG.DsCEPDevedor_${UF}}          #(DEVEDOR) CEP
        Write To Cell  X${i+1}  ${TELEFONE_DEVEDOR}                #(DEVEDOR) TELEFONE
        Write To Cell  Y${i+1}  DADOS GERADOS VIA ROBOT FRAMEWORK  #COMENTÁRIO
        E gravo as informações no arquivo XLSX criado anteriormente    ${UF}
        ${x}                 Set Variable     ${x+1}                
    END
    Save   ${XLS}

    Log to Console     ==============================================================================
    Log To Console     Arquivo xlsx criado
    Log to Console     ==============================================================================\n

########################################### FIM


