
*** Variables ***
#######################################################################
##                                                                   ##
##                 Configuração de Ambiente                          ##
##                                                                   ##
## ####################################################################

*** Settings ***

########################################################################
##                                                                    ##     
##                    Libraries de todo o projeto                     ##
##                                                                    ##
## #####################################################################
## CRIADO POR: AUGUSTO OLIVEIRA                                       ##
## DATA: 12/2023                                                      ##
## ÁREA: AUTOMATED TESTS - QUALITY ASSURANCE                          ##
## #####################################################################

Library         SeleniumLibrary
Library         String
Library         FakerLibrary    locale=pt_BR
Library         OperatingSystem
Library         DatabaseLibrary
Library         SoapLibrary
Library         RequestsLibrary
Library         Collections
Library         DateTime
Library         DebugLibrary
Library         Process
Library         JSONLibrary
LIbrary         ExcelLibrary
LIbrary         ExcellentLibrary
Library         CSVLibrary
Library         libs/arquivo.py

########################################################
#                        Hooks                         #
########################################################
Resource    hooks.robot

########################################################
#                      Pages Web                       #
########################################################

########################################################
#                     Keywords Web                    #
########################################################
Resource    arquivos/arquivo_csv.robot
Resource    arquivos/arquivo_json.robot
Resource    arquivos/arquivo_txt.robot
Resource    arquivos/arquivo_xlsx.robot
Resource    arquivos/arquivo_csv.robot

########################################################
#                        Data                          #
########################################################
Variables    data/register.yml

########################################################
#                 Keywords Web Service                 #
########################################################
Resource     keywords/kws_gerando_arquivo_json.robot
Resource     keywords/kws_gerando_arquivo_txt.robot
Resource     keywords/kws_gerando_arquivo_xls.robot
Resource     keywords/kws_gerando_arquivo_csv.robot
Resource     keywords/kws_gerando_variaveis.robot

