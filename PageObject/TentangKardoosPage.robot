*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${textTentangKardoosTitle}        xpath=//div[@class='header header-tentang-kardoos']//h1

*** Keywords ***
user is on tentang kardoos page
    Wait Until Element Is Visible        ${textTentangKardoosTitle}
    Element Should Be Visible            ${textTentangKardoosTitle}    