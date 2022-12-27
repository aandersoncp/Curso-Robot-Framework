*** Settings ***
Documentation  Essa suite teste o site da amazon.com.br
Resource       amazon_resources.robot
Test Setup     Abrir navegador
Test Teardown  Fechar o navegador

*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]  Esse teste verifica o menu de eletrônicoa do site da amazon.com.br
   ...              e verifica a categoria Computadores e Informática
    [Tags]           menus  categorias
    Acessar a home page do site Amazon.com.br
    Entrar no menu "Eletrônicos"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
   Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a categoria "Computadores e Informática"

 Caso de Teste 02 - Pesquisa de um Produto
     [Documentation]  Esse teste verifica a busca de um produto
     [Tags]           busca_produtos  lista_busca
     Acessar a home page do site Amazon.com.br
     Digitar o nome de produto "Xbox Series S" no campo de pesquisa
     Clicar no botão de pesquisa
     Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"