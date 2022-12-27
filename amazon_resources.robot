*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                   https://www.amazon.com.br/
${MENU_ELETRONICOS}      //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${TITULO_ELETRONICOS}    //h1[contains(.,'Eletrônicos e Tecnologia')]
${CAMPO_BUSCA}           //input[contains(@type,'text')]

*** Keywords ***
Abrir navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

 Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element     locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Wait Until Page Contains    text=Eletrônicos e Tecnologia
    Wait Until Element Is Visible    locator=${TITULO_ELETRONICOS}

Verificar se o título da página fica "${TITLE}"
    Title Should Be    title=${TITLE}
    
Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Wait Until Page Contains    text=${NOME_CATEGORIA}
    Element Should Be Visible    locator=//img[contains(@alt,'${NOME_CATEGORIA}')]

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
#    Click Element    locator=${CAMPO_BUSCA}
    Input Text    locator=${CAMPO_BUSCA}    text=${PRODUTO}
    
Clicar no botão de pesquisa
    Click Element    locator=//input[contains(@type,'submit')]

Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Wait Until Page Contains    text=${PRODUTO}

