from datetime import date, datetime
from pathlib import Path
from random import randint
import shutil, tempfile
import base64
import csv
from codecs import replace_errors
from datetime import date, datetime
from pathlib import Path
from random import randint
import shutil, tempfile
from tokenize import group
import unicodedata
import re
from unicodedata import normalize
from datetime import date, datetime
from pathlib import Path
from random import randint
from re import S
import shutil, tempfile
import os
import string
from reportlab.pdfgen import canvas
import base64
from selenium import webdriver
from PIL import Image
from os import listdir
from os.path import isfile, join
import pathlib
import numpy as np
from openpyxl import Workbook
import os
from PIL import Image


#### Remover acentos
def remover_acentos_nome(nomedevedor: str) -> str:
    normalized = unicodedata.normalize('NFD', nomedevedor)
    return normalized.encode('ascii', 'ignore').decode('utf-8')
if __name__ == "__main__":    
    print(normalize)  
    
def remover_acentos_firstname(pri_nome_usuario: str) -> str:
    normalized = unicodedata.normalize('NFD', pri_nome_usuario)
    return normalized.encode('ascii', 'ignore').decode('utf-8')
if __name__ == "__main__":    
    print(normalize)

def remover_acentos_lastname(ult_nome_usuario: str) -> str:
    normalized = unicodedata.normalize('NFD', ult_nome_usuario)
    return normalized.encode('ascii', 'ignore').decode('utf-8')
if __name__ == "__main__":    
    print(normalize)    

def remover_acentos_empresa(empresa_fake: str) -> str:
    normalized = unicodedata.normalize('NFD', empresa_fake)
    return normalized.encode('ascii', 'ignore').decode('utf-8')
if __name__ == "__main__":    
    print(normalize)    

def remover_acentos_endereco(endereco_fake: str) -> str:
    normalized = unicodedata.normalize('NFD', endereco_fake)
    return normalized.encode('ascii', 'ignore').decode('utf-8')
if __name__ == "__main__":    
    print(normalize)        


#### Código de Telefones das Capitais
def envia_uf_telefone(uf):     
    
    if uf == 'AC':
         return  '68'
    elif uf == 'AL':
         return  '82'
    elif uf == 'AM':
         return  '92'    
    elif uf == 'AP':
         return  '96'
    elif uf == 'BA':
         return  '71'
    elif uf == 'CE':
         return  '85'
    elif uf == 'DF':
         return  '61'    
    elif uf == 'ES':
         return  '27'
    elif uf == 'GO':
         return  '62'
    elif uf == 'MA':
         return  '98'
    elif uf == 'MG':
         return  '31'
    elif uf == 'MS':
         return  '67'
    elif uf == 'MT':
         return  '65'
    elif uf == 'PA':
         return  '91'
    elif uf == 'PB':
         return  '83'
    elif uf == 'PE':
         return  '81'
    elif uf == 'PI':
         return  '86'
    elif uf == 'PR':
         return  '41'
    elif uf == 'RJ':
         return  '21'
    elif uf == 'RN':
         return  '84'
    elif uf == 'RO':
         return  '69'
    elif uf == 'RS':
         return  '51'                      
    elif uf == 'RR':
         return  '95'
    elif uf == 'SC':
         return  '48'
    elif uf == 'SE':
         return  '79'
    elif uf == 'SP':
         return  '11'
    elif uf == 'TO':
         return  '63'         
    else:
        return '99'      

#### Contador de linhas
def gerar_contador_linhas(linhas):

    numlinhas = f'{np.random.choice([linhas]):0>6}'
    return  numlinhas

def gerar_contador_linhas_arq(seq):
    numlinhas = f'{np.random.choice([seq]):0>4}'
    return  numlinhas

#### Converter arquivos TXT para BASE64
def converte_arquivo_base64(arq_base64):

     with open(arq_base64, "rb") as arquivo :
        data = base64.b64encode(arquivo.read())
     return data.decode('utf-8')
 
#### Converter arquivo BASE64 para TXT
def converte_arquivo_txt(arq_base64, arq_txt):
 
    with open(arq_txt, 'rb') as arquivo_base64:    
        conteudo_base64 = arquivo_base64.read()                 # Leia o conteúdo do arquivo Base64    
    conteudo_decodificado = base64.b64decode(conteudo_base64)   # Decodifique o conteúdo Base64    
    with open(arq_txt, 'wb') as arquivo_destino:        # Escreva o conteúdo decodificado em um novo arquivo de texto
        arquivo_destino.write(conteudo_decodificado)   

 