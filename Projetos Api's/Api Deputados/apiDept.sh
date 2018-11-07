#!/bin/bash

#nome tratado
dep=$(echo $1 | sed "s, ,%20,g")
#nome autor
nome=$(curl -s "http://www.camara.leg.br/SitCamaraWS/Proposicoes.asmx/ListarProposicoes?sigla=&numero=&ano=&datApresentacaoIni=&datApresentacaoFim=&parteNomeAutor=$dep&idTipoAutor=&siglaPartidoAutor=&siglaUFAutor=&generoAutor=&codEstado=&codOrgaoEstado=&emTramitacao=" | grep "txtNome" | tail -n 1 | cut -d "<" -f2 | cut -d">" -f2)
echo -e "\n\e[1;7m-------- Nome do deputado -----  \e[1;31m$nome\e[00m\e[1;7m-------------\e[00m"
#pega o texto
curl -s "http://www.camara.leg.br/SitCamaraWS/Proposicoes.asmx/ListarProposicoes?sigla=&numero=&ano=&datApresentacaoIni=&datApresentacaoFim=&parteNomeAutor=$dep&idTipoAutor=&siglaPartidoAutor=&siglaUFAutor=&generoAutor=&codEstado=&codOrgaoEstado=&emTramitacao=" | grep "txtEmenta" |
lynx -stdin -dump
#conta as proposições
num=$(curl -s "http://www.camara.leg.br/SitCamaraWS/Proposicoes.asmx/ListarProposicoes?sigla=&numero=&ano=&datApresentacaoIni=&datApresentacaoFim=&parteNomeAutor=$dep&idTipoAutor=&siglaPartidoAutor=&siglaUFAutor=&generoAutor=&codEstado=&codOrgaoEstado=&emTramitacao=" | grep -c "txtEmenta")
echo -e "\n\e[1;7m-------- Número de proposições = \e[1;31m$num\e[00m\e[1;7m-------------\e[00m"
