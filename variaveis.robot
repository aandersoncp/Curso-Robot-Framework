*** Settings ***
Resource    amazon_resources.robot


*** Test Cases ***

Caso de Teste que mostra os meses do ano
    Mostrar os meses do ano

Caso de Teste que mostra a quantidade de dias de cada mes
    [Tags]             meses_dias
    Mostrar quantidade de dias de cada mes