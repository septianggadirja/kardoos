*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${inputEmail}            xpath=//input[@id='email']
${inputPassword}         xpath=//input[@id='password']
${buttonMasuk}           xpath=//button[@id='login-button']

*** Keywords ***
user is on login page
    Wait Until Element Is Visible        ${buttonMasuk}
    Element Should Be Visible            ${buttonMasuk}

user input email for login
    Wait Until Element Is Visible        ${inputEmail}
    Clear Element Text                   ${inputEmail}
    Input Text                           ${inputEmail}    ${ACCOUNT_EMAIL}

user input password for login
    Wait Until Element Is Visible        ${inputPassword}
    Clear Element Text                   ${inputPassword}
    Input Text                           ${inputPassword}    ${ACCOUNT_PASSWORD}

user input credential for login
    user input email for login
    user input password for login

user click button masuk for login
    Wait Until Element Is Visible        ${buttonMasuk}
    Click Element                        ${buttonMasuk}