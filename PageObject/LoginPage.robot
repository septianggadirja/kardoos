*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${inputEmail}            xpath=//input[@placeholder='Email']
${inputPassword}         xpath=//input[@id='password']
${buttonMasuk}           xpath=//button[text()='Masuk']
${buttonLupaPassword}    xpath=//a[text()='Lupa Password?']

*** Keywords ***
user is on login page
    Wait Until Element Is Visible        ${buttonMasuk}
    Element Should Be Visible            ${buttonMasuk}

user input email for login
    Wait Until Element Is Visible        ${inputEmail}
    Input Text                           ${inputEmail}    ${ACCOUNT_EMAIL}

user input password for login
    Wait Until Element Is Visible        ${inputPassword}
    Input Text                           ${inputPassword}    ${ACCOUNT_PASSWORD}

user input credential for login
    user input email for login
    user input password for login

user click button masuk for login
    Wait Until Element Is Visible        ${buttonMasuk}
    Click Element                        ${buttonMasuk}