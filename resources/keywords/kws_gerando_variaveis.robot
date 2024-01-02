*** Settings ***
Documentation    Gerando as variáveis para utlização na geração de arquivos

Resource    ../base.robot

*** Keywords ***
Gerar Número Contrato
    ${RANDOM_NUMBER}=      Generate Random String          11      [NUMBERS]    
    Set Suite Variable       ${NUM_CONTRATO}        ${RANDOM_NUMBER}

Gerar CPF
    ${CUSTOM_CPF}         FakerLibrary.cpf    
    ${CPF_CUSTOM}         Remove String        ${CUSTOM_CPF}            .    -
    Set Suite Variable    ${CPF_FAKE}          ${CPF_CUSTOM} 

Gerar CNPJ
   ${CUSTOM_CNPJ}        FakerLibrary.cnpj
   ${CNPJ_CUSTOM}        Remove String       ${CUSTOM_CNPJ}          .    /    -
   Set Suite Variable    ${CNPJ_FAKE}        ${CNPJ_CUSTOM}  

Gerar Cor
    ${CORES}    Create List
    ...		VERMELHA	VERDE		ROXA		ROSA
    ...		PRETA		PRATA		MARROM		LARANJA
    ...		GRENA		DOURADA		CINZA		BRANCA
    ...		BEGE		AZUL		AMARELA     LILAS
    FOR    ${COR}    IN    @{CORES}
        ${SIZE}    Evaluate    len(${CORES}) - 1
        ${RAND}    FakerLibrary.random int    min=0    max=${SIZE}        
        Set Suite Variable    ${COR_GERADA}        ${CORES[${RAND}]}        
    END

Gerar Data
    ${DATE} =   Get Current date  
    ${DATE} =	Convert Date	   ${DATE}	  result_format=%Y%m%d
    ${DATA_FORMATADA} =	Convert Date	   ${DATE}	  result_format=%d/%m/%Y
    ${DATA_30DIAS_APOS} =     Add Time To Date    ${DATE}    30 days     result_format=%Y%m%d
    ${DATA_3NOS_APOS} =       Add Time To Date    ${DATE}    1095 days   result_format=%Y%m%d
    ${ANO_ATUAL} =     Convert Date	       ${DATE}	  result_format=%Y
    ${DATETIME} =   Convert Date    ${DATE}     result_format=%I%M

    Set Suite Variable    ${HORA_LOTE}      ${DATETIME} 
    Set Suite Variable    ${DATE}
    Set Suite Variable    ${DATA_FORMATADA}
    Set Suite Variable    ${DATA_30DIAS_APOS}
    Set Suite Variable    ${DATA_3NOS_APOS}
    Set Suite Variable    ${ANO_ATUAL}

Gerar Nome Empresa
    ${NOME_EMPRESA_FAKE}       FakerLibrary.Company
    ${NOME_EMPRESA_FAKE}       Convert To Upper Case        ${NOME_EMPRESA_FAKE}
    ${NOME_EMPRESA_FAKE}       Remover Acentos Empresa      ${NOME_EMPRESA_FAKE}    
    Set Test Variable    ${NOME_EMPRESA_FAKE}    
    Set Test Variable    ${COMPL_NOME_EMPRESA}        50
    ${EMPRESA_FAKE}    Get Length    ${NOME_EMPRESA_FAKE}
    ${EMPRESA_COMPL}=    Evaluate    ${COMPL_NOME_EMPRESA} - ${EMPRESA_FAKE}
    Set Suite Variable    ${NOME_EMPRESA}     ${NOME_EMPRESA_FAKE}${SPACE * ${EMPRESA_COMPL}} 

Gerar Nome e Email Empresa
    ${EMPRESA_FAKE}       FakerLibrary.Company
    ${EMPRESA_FAKE}       Convert To Upper Case        ${EMPRESA_FAKE}
    ${EMPRESA_FAKE}       Remover Acentos Empresa      ${EMPRESA_FAKE}    
    Set Suite Variable    ${EMPRESA_FAKE}
    ${EMAILEMPRESA}=      Remove String                ${EMPRESA_FAKE}    ${SPACE * 1}
    ${EMAILEMPRESA}=      Remove String               ${EMAILEMPRESA}     .
    Set Test Variable     ${EMPRESA_EMAIL}    ${EMAILEMPRESA}@${EMAILEMPRESA}.com
    ${EMPRESA_EMAIL}      Convert To Lower Case        ${EMPRESA_EMAIL}
    Set Suite Variable    ${EMAIL_EMPRESA}    ${EMPRESA_EMAIL}

Gerar Endereço Empresa
    ${ENDERECO_FAKE}      FakerLibrary.Street Name
    ${ENDERECO_FAKE}      Convert To Upper Case        ${ENDERECO_FAKE}
    ${ENDERECO_FAKE}      Remover Acentos Endereco     ${ENDERECO_FAKE}  
    Set Suite Variable    ${ENDERECO_FAKE}
    Set Test Variable    ${COMPL_ENDERECO_EMPRESA}    50
    ${ENDERECO_EMPRESA_FAKE}    Get Length    ${ENDERECO_FAKE}
    ${ENDERECO_EMPRESA_COMPL}=    Evaluate    ${COMPL_ENDERECO_EMPRESA} - ${ENDERECO_EMPRESA_FAKE}
    Set Suite Variable    ${ENDERECO_EMPRESA}     ${ENDERECO_FAKE}${SPACE * ${ENDERECO_EMPRESA_COMPL}} 

Gerar Número Empresa
    ${RANDOM_NUMBER}=      Generate Random String          4      [NUMBERS]    
    Set Suite Variable       ${NUMERO_FAKE}        ${RANDOM_NUMBER}

Gerar Complemento Endereço Empresa
    ${RANDOM_NUMBER}=      Generate Random String        2      [NUMBERS]    
    Set Suite Variable       ${COMPL_NUM_EMPRESA}        LOJA 0${RANDOM_NUMBER}

Gerar Bairro Empresa
    ${BAIRRO_FAKE}      FakerLibrary.City
    ${BAIRRO_FAKE}      Convert To Upper Case        ${BAIRRO_FAKE}
    ${BAIRRO_FAKE}      Remover Acentos Endereco     ${BAIRRO_FAKE}  
    Set Suite Variable    ${BAIRRO_FAKE}
    Set Test Variable    ${COMPL_ENDERECO_EMPRESA}    30
    ${BAIRRO_EMPRESA_FAKE}    Get Length    ${BAIRRO_FAKE}
    ${BAIRRO_EMPRESA_COMPL}=    Evaluate    ${COMPL_ENDERECO_EMPRESA} - ${BAIRRO_EMPRESA_FAKE}
    Set Suite Variable    ${BAIRRO_EMPRESA}     ${BAIRRO_FAKE}${SPACE * ${BAIRRO_EMPRESA_COMPL}} 

Gerar Cidade Empresa
    [Arguments]    ${UF}
    Set Suite Variable    ${CIDADE_EMPRESA_FIXO}    ${REG.NomeMunicipioEsperado_${UF}}
    Set Test Variable     ${COMPL_MUNICPIO_EMPRESA}    30
    ${CIDADE_EMPRESA_COUNT}    Get Length      ${CIDADE_EMPRESA_FIXO}
    ${CIDADE_EMPRESA_QTD}=     Evaluate        ${COMPL_MUNICPIO_EMPRESA} - ${CIDADE_EMPRESA_COUNT}
    Set Suite Variable    ${CIDADE_EMPRESA}    ${CIDADE_EMPRESA_FIXO}${SPACE * ${CIDADE_EMPRESA_QTD}} 

Gerar Telefone Empresa
    [Arguments]     ${UF}   
    ${RANDOM_NUMBER}=      Generate Random String          8      [NUMBERS]        
    ${DDD}    Envia Uf Telefone    ${UF}
    Set Suite Variable    ${TELEFONE_EMPRESA}    ${DDD}9${RANDOM_NUMBER}

Gerar Nome e Email Devedor
    ${PRI_NOME_USUARIO}       FakerLibrary.FirstName
    ${PRI_NOME_USUARIO}       Convert To Upper Case        ${PRI_NOME_USUARIO}
    ${ULT_NOME_USUARIO}       FakerLibrary.LastName
    ${ULT_NOME_USUARIO}       Convert To Upper Case        ${ULT_NOME_USUARIO}
    Set Test Variable         ${NOMEDEVEDOR}               ${PRI_NOME_USUARIO} ${ULT_NOME_USUARIO}
    ${NOMEDEVEDOR}            Remover Acentos Nome         ${NOMEDEVEDOR}
    Set Suite variable        ${NOME_DEVEDOR}              ${NOMEDEVEDOR} 
    
    Set Test Variable    ${COMPL_NOME_DEVEDOR}    40
    ${DEVEDOR_NOME_COMPL}    Get Length    ${NOME_DEVEDOR}   
    ${COMPL_DEVEDOR}=    Evaluate    ${COMPL_NOME_DEVEDOR} - ${DEVEDOR_NOME_COMPL}
    Set Suite Variable    ${NOME_DEVEDOR_FAKE}     ${NOME_DEVEDOR}${SPACE * ${COMPL_DEVEDOR}} 

    ${PRINOME_USUARIO}=       Remove String                ${PRI_NOME_USUARIO}    ${SPACE * 1}   
    Set Suite Variable        ${PRINOME_USUARIO}

    ${ULTNOME_USUARIO}=       Remove String                ${ULT_NOME_USUARIO}    ${SPACE * 1}    
    Set Suite Variable        ${ULTNOME_USUARIO}
    
    Set Test Variable         ${EMAILDEVEDOR}    ${PRINOME_USUARIO}.${ULTNOME_USUARIO}@gmail.com
    ${EMAILDEVEDOR}           Convert To Lower Case        ${EMAILDEVEDOR}
    Set Suite Variable        ${EMAIL_DEVEDOR}             ${EMAILDEVEDOR}

Gerar Endereço Devedor
    ${ENDERECO_DEV_FAKE}      FakerLibrary.Street Name
    ${ENDERECO_DEV_FAKE}      Convert To Upper Case        ${ENDERECO_DEV_FAKE}
    ${ENDERECO_DEV_FAKE}      Remover Acentos Endereco     ${ENDERECO_DEV_FAKE}  
    Set Suite Variable    ${ENDERECO_DEV_FAKE}
    Set Test Variable    ${COMPL_ENDERECO_DEVEDOR}    50
    ${DEVEDOR_NOME_COMPL}    Get Length    ${ENDERECO_DEV_FAKE}   
    ${COMPL_DEVEDOR}=    Evaluate    ${COMPL_ENDERECO_DEVEDOR} - ${DEVEDOR_NOME_COMPL}
    Set Suite Variable    ${ENDERECO_DEVEDOR}     ${ENDERECO_DEV_FAKE}${SPACE * ${COMPL_DEVEDOR}} 
        
Gerar Número Endereço Devedor
    ${RANDOM_NUMBER}=      Generate Random String          3      [NUMBERS]    
    Set Suite Variable       ${NUMERO_ENDERECO_DEVEDOR}        ${RANDOM_NUMBER}

Gerar Bairro Devedor
    ${BAIRRO_DEV_FAKE}      FakerLibrary.Country
    ${BAIRRO_DEV_FAKE}      Convert To Upper Case        ${BAIRRO_DEV_FAKE}
    ${BAIRRO_DEV_FAKE}      Remover Acentos Endereco     ${BAIRRO_DEV_FAKE}  
    Set Suite Variable    ${BAIRRO_DEV_FAKE}
    Set Test Variable    ${COMPL_ENDERECO_DEVEDOR}    30
    ${BAIRRO_DEVEDOR_FAKE}    Get Length    ${BAIRRO_DEV_FAKE}
    ${BAIRRO_DEVEDOR_COMPL}=    Evaluate    ${COMPL_ENDERECO_DEVEDOR} - ${BAIRRO_DEVEDOR_FAKE}
    Set Suite Variable    ${BAIRRO_DEVEDOR}     ${BAIRRO_DEV_FAKE}${SPACE * ${BAIRRO_DEVEDOR_COMPL}} 

Gerar Cidade Devedor
    [Arguments]    ${UF}
    Set Suite Variable    ${CIDADE_DEVEDOR_FIXO}    ${REG.NomeMunicipioEsperado_${UF}}
    Set Test Variable     ${COMPL_MUNICPIO_DEVEDOR}    30
    ${CIDADE_DEVEDOR_COUNT}    Get Length      ${CIDADE_DEVEDOR_FIXO}
    ${CIDADE_DEVEDOR_QTD}=     Evaluate        ${COMPL_MUNICPIO_DEVEDOR} - ${CIDADE_DEVEDOR_COUNT}
    Set Suite Variable    ${CIDADE_DEVEDOR}    ${CIDADE_DEVEDOR_FIXO}${SPACE * ${CIDADE_DEVEDOR_QTD}}

Gerar Telefone Devedor
    [Arguments]     ${UF}   
    ${RANDOM_NUMBER}=      Generate Random String          8      [NUMBERS]        
    ${DDD}    Envia Uf Telefone    ${UF}
    Set Suite Variable    ${TELEFONE_DEVEDOR}    ${DDD}9${RANDOM_NUMBER}
