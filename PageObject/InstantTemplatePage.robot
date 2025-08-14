*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${buttonBeliSekarang}        xpath=(//button[text()='Beli Sekarang!'])[1]
${textTitleModelBox}         xpath=(//button[text()='Beli Sekarang!'])[1]/parent::div/h1

*** Keywords ***
user is on instant template page
    Wait Until Element Is Visible        ${buttonBeliSekarang}
    Element Should Be Visible            ${buttonBeliSekarang}

user click beli sekarang on instant template page
    Wait Until Element Is Visible        ${buttonBeliSekarang}
    Click Button                         ${buttonBeliSekarang}

user is on instant template page based on model
    [Arguments]    ${modelBox}
    Sleep    5
    Wait Until Element Is Visible    ${textTitleModelBox}
    Element Should Be Visible        ${textTitleModelBox}
    Element Should Contain    ${textTitleModelBox}    ${modelBox}
    Element Should Be Visible            ${buttonBeliSekarang}