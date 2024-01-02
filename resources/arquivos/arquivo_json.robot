*** Settings ***
Documentation    Configurador de Arquivo do Tipo --> JSON

Resource    ../base.robot

*** Keywords ***
Configurar Arquivo JSON
    [Arguments]    ${UF}
    Log to Console     \n==============================================================================
    Log To Console      Configurando Arquivo JSON
    Log to Console     ==============================================================================\n    


#### Montando o Arquivo JSON
    ${x}    set variable    ${0}
    FOR     ${i}      IN RANGE    0    1
        ${JSON}    Set Variable         ${EXECDIR}${/}resources\\arquivos\\json\\Arquivo_JSON_${UF}.json
        Set Suite Variable     ${JSON} 
        Create File            ${JSON}
    #### Gerando dados Fakes da Empresa
        Gerar Número Contrato
        Gerar Data
        Gerar Nome e Email Empresa
        Gerar CNPJ
        Gerar Endereço Empresa
        Gerar Número Empresa
        Gerar Bairro Empresa    
        Gerar Telefone Empresa    ${UF}

        Append To File    ${JSON}   { \n
        Append To File    ${JSON}   "Contrato":{ \n
        Append To File    ${JSON}   "NumeroContrato":"${NUM_CONTRATO}",\n
        Append To File    ${JSON}   "DataContrato":"${DATE}",\n
        Append To File    ${JSON}   },\n
        
        Append To File    ${JSON}   "Empresa":{\n
        Append To File    ${JSON}   "NomeEmpresa":"${EMPRESA_FAKE}",\n
        Append To File    ${JSON}   "EmailEmpresa":"${EMAIL_EMPRESA}",\n
        Append To File    ${JSON}   "Documento":{\n
        Append To File    ${JSON}   "CnpjEmpresa":"${CNPJ_FAKE}"\n
        Append To File    ${JSON}   },\n
        Append To File    ${JSON}   "Endereco":{\n
        Append To File    ${JSON}   "Municipio":{\n
        Append To File    ${JSON}   "CodMunicipioEmpresa":"${REG.CdMunicipioCredor_${UF}}"\n
        Append To File    ${JSON}   "NomeMunicipioEmpresa":"${REG.NomeMunicipioEsperado_${UF}}"\n
        Append To File    ${JSON}   },\n
        Append To File    ${JSON}   "LogradouroEmpresa":"${ENDERECO_FAKE}",\n
        Append To File    ${JSON}   "NumeroImovelEmpresa":"${NUMERO_FAKE}",\n
        Append To File    ${JSON}   "BairroEmpresa":"${BAIRRO_FAKE}",\n        
        Append To File    ${JSON}   "UfEmpresa":"${UF}",\n
        Append To File    ${JSON}   "CepEmpresa":"${REG.DsCEPCredor_${UF}}"\n
        Append To File    ${JSON}   },\n
        Append To File    ${JSON}   "Telefone":{\n    
        Append To File    ${JSON}   "NumeroEmpresa":"${TELEFONE_EMPRESA}"\n
        Append To File    ${JSON}   }\n
        Append To File    ${JSON}   },\n
        
    #### Gerando dados Fakes do Devedor
        Gerar Nome e Email Devedor
        Gerar CPF       
        Gerar Endereço Devedor
        Gerar Número Endereço Devedor
        Gerar Bairro Devedor  
        Gerar Telefone Devedor    ${UF}

        Append To File    ${JSON}   "Devedor": {\n
        Append To File    ${JSON}   "NomeDevedor":"${NOME_DEVEDOR}",\n
        Append To File    ${JSON}   "EmailDevedor":"${EMAIL_DEVEDOR}",\n
        Append To File    ${JSON}   "Documento":{\n
        Append To File    ${JSON}   "CpfDevedor":"${CPF_FAKE}"\n
        Append To File    ${JSON}   },\n
        Append To File    ${JSON}   "Endereco":{\n
        Append To File    ${JSON}   "Municipio":{\n
        Append To File    ${JSON}   "CodMunicipioDevedor":"${REG.CdMunicipioDevedor_${UF}}"\n
        Append To File    ${JSON}   "NomeMunicipioDevedor":"${REG.NomeMunicipioEsperado_${UF}}"\n    
        Append To File    ${JSON}   },\n
        Append To File    ${JSON}   "LogradouroDevedor":"${ENDERECO_DEV_FAKE}",\n
        Append To File    ${JSON}   "NumeroImovelDevedor":"${NUMERO_ENDERECO_DEVEDOR}",\n
        Append To File    ${JSON}   "BairroDevedor":"${BAIRRO_DEV_FAKE}",\n
        Append To File    ${JSON}   "UfDevedor":"${UF}",\n
        Append To File    ${JSON}   "CepDevedor":"${REG.DsCEPDevedor_${UF}}"\n
        Append To File    ${JSON}   },\n
        Append To File    ${JSON}   "Telefone":{ \n
        Append To File    ${JSON}   "NumeroDevedor":"${TELEFONE_DEVEDOR}"\n
        Append To File    ${JSON}   }\n
        Append To File    ${JSON}   },\n
        Append To File    ${JSON}   "Webhook":null\n
        Append To File    ${JSON}   }             
        E gravo as informações do arquivo JSON criado anteriormente    ${UF}        
        ${x}                 Set Variable     ${x+1}                
    END
    Log to Console     ==============================================================================
    Log To Console      Arquivo JSON criado para a UF "${UF}"
    Log to Console     ==============================================================================\n
    