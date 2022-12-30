*** Settings ***
Documentation   Exercício do curso de robotframework
Library     String

*** Variables ***
${EMAIL_USUARIO}
${NOME}
${SOBRENOME}

*** Test Cases ***
Gerar email
    Gerar email para usuário "anderson" "costa"

*** Keywords ***
Gerar email para usuário "${NOME}" "${SOBRENOME}"
    ${EMAIL_USUARIO}      Guardar nome e sobrenome   ${NOME}    ${SOBRENOME}
    Log To Console    message=${EMAIL_USUARIO}

Guardar nome e sobrenome
    [Arguments]     ${NOME_USUARIO}     ${SOBRENOME_USUARIO}
    ${RANDOM_WORD}    Generate Random String    5-8
    [Return]    ${NOME_USUARIO}${SOBRENOME_USUARIO}${RANDOM_WORD}@testerobot.com


