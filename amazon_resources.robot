*** Settings ***
Library    SeleniumLibrary

*** Variable ***
&{MESES_ANO_DIAS}       janeiro=31  fevereiro=28  marco=31  abril=30  maio=31  junho=30  julho=31  agosto=31  setembro=30  outubro=31  novembro=30  dezembro=31

*** Variables ***
${URL}                   https://www.amazon.com.br/
${MENU_ELETRONICOS}      //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${TITULO_ELETRONICOS}    //h1[contains(.,'Eletrônicos e Tecnologia')]
${CAMPO_BUSCA}           //input[contains(@type,'text')]
@{MESES_ANO}             Janeiro  Fevereiro  Março  Abril  Maio  Junho  Julho  Agosto  Setembro  Outubro  Novembro  Dezembro

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

Adicionar o produto "${PRODUTO}" no carrinho
    Click Element    locator=//img[contains(@alt,'Console Xbox Series S')]
    Wait Until Element Is Visible    locator=//input[contains(@name,'submit.add-to-cart')]
    Click Element    locator=//input[contains(@name,'submit.add-to-cart')]

Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Wait Until Page Contains    text=Adicionado ao carrinho

Remover o produto "Console Xbox Series S" do carrinho
    Wait Until Element Is Visible    locator=//a[contains(@data-csa-c-type,'button')]
    Click Element    locator=//a[contains(@data-csa-c-type,'button')]
    Wait Until Element Is Visible    locator=//span[@class='a-truncate-cut'][contains(.,'Console Xbox Series S')]
    Click Element    locator=//input[contains(@aria-label, 'Excluir Console Xbox Series S')]

Verificar se o carrinho fica vazio
    Wait Until Page Contains    text=Seu carrinho de compras da Amazon está vazio.

# --------------------------------------------------------------------------------

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br

Quando adicionar o produto "Console Xbox Series S" no carrinho
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho

Então o produto "Console Xbox Series S" deve ser mostrado no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

E existe o produto "Console Xbox Series S" no carrinho
    Quando adicionar o produto "Console Xbox Series S" no carrinho

Quando remover o produto "Console Xbox Series S" do carrinho
    Remover o produto "Console Xbox Series S" do carrinho

Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio

#----------------------------------

Mostrar os meses do ano
    Log To Console    ${MESES_ANO[0]}
    Log To Console    ${MESES_ANO[1]}
    Log To Console    ${MESES_ANO[2]}
    Log To Console    ${MESES_ANO[3]}
    Log To Console    ${MESES_ANO[4]}
    Log To Console    ${MESES_ANO[5]}
    Log To Console    ${MESES_ANO[6]}
    Log To Console    ${MESES_ANO[7]}
    Log To Console    ${MESES_ANO[8]}
    Log To Console    ${MESES_ANO[9]}
    Log To Console    ${MESES_ANO[10]}
    Log To Console    ${MESES_ANO[11]}

Mostrar quantidade de dias de cada mes
    Log To Console    Janeiro = ${MESES_ANO_DIAS.janeiro}
    Log To Console    Fevereiro = ${MESES_ANO_DIAS.fevereiro}
    Log To Console    Março = ${MESES_ANO_DIAS.marco}
    Log To Console    Abril = ${MESES_ANO_DIAS.abril}
    Log To Console    Maio = ${MESES_ANO_DIAS.maio}
    Log To Console    Junho = ${MESES_ANO_DIAS.junho}
    Log To Console    Julho = ${MESES_ANO_DIAS.julho}
    Log To Console    Agosto = ${MESES_ANO_DIAS.agosto}
    Log To Console    Setembro = ${MESES_ANO_DIAS.setembro}
    Log To Console    Outubro = ${MESES_ANO_DIAS.outubro}
    Log To Console    Novembro = ${MESES_ANO_DIAS.novembro}
    Log To Console    Dezembro = ${MESES_ANO_DIAS.dezembro}