*** Settings ***

Resource        ./base.robot

*** Variables ***
${CLOUD}                    false
${browser}                  chrome

####### AMBIENTE DE TESTE
${PORTAL}        https://.com.br


*** Keywords ***
Open Session
    #Open Browser            about:blank        headlesschrome
    Open Browser    about:blank    ${browser}    options=add_experimental_option('excludeSwitches', ['enable-logging'])    
    #Open Browser   browser=chrome  options=add_experimental_option("detach", True)
    
    Set Selenium Timeout    30
    Set Window Size                 1280    1080
    Set Window Position             1285     0    
    Go To                   ${PORTAL}    
    #Maximize Browser Window    

Close Session
    Capture Page Screenshot
    Close Browser

Aguardando Salvamento
    Wait Until Page Contains                Mensagem se houver
    Wait Until Page Does Not Contain        Mensagem se houver


    
    