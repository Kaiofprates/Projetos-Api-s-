# -*- coding: utf-8 -*-
"""
@author: kaiofprates
"""

import requests
import xml.etree.ElementTree as ET
from Tkinter import *

root = Tk()
root.title("Api _ Câmara dos Deputados")
root.geometry('600x600')
root['bg'] = '#4B0082'

letra1= Text(root, height = 28, width = 72)
letra1.place(x = 10, y = 90)

def busca():
    letra1.delete(1.0,END)
    name = dep.get()
    name = name.replace(' ','%20')
    url = requests.get("http://www.camara.leg.br/SitCamaraWS/Proposicoes.asmx/ListarProposicoes?sigla=&numero=&ano=&datApresentacaoIni=&datApresentacaoFim=&parteNomeAutor="+name+"&idTipoAutor=&siglaPartidoAutor=&siglaUFAutor=&generoAutor=&codEstado=&codOrgaoEstado=&emTramitacao=")
    root = ET.fromstring(url.content)
    for i in range(len(root)):
        letra1.insert(INSERT,"proposição número = "+str(root[i][1].text)+" ano ="+str(root[i][4].text))
        letra1.insert(INSERT,'\n')
        letra1.insert(INSERT,root[i][7].text)
        letra1.insert(INSERT,'\n')


lab = Label(root, text = "Nome do deputado:", bg = '#4B0082',fg = "white")
lab.place(x = 10, y = 30)

dep = Entry(root,width = 40)
dep.place(x = 160, y = 30)

bot = Button(root,width = 7, text = "Pesquisar",bg = '#4B0082', fg = 'white', command = busca)
bot.place(x = 490, y = 30)



root.mainloop()
