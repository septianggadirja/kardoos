*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${textTentangKardoosTitle}        xpath=//p[contains(text(),'box')]

*** Keywords ***
user is on tentang kardoos page
    Wait Until Element Is Visible        ${textTentangKardoosTitle}
    Element Should Be Visible            ${textTentangKardoosTitle}    