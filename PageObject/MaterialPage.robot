*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${textMaterialTitle}        xpath=//h1[@class='title-header' and text()='Material']

*** Keywords ***
user is on material page
    Wait Until Element Is Visible        ${textMaterialTitle}
    Element Should Be Visible            ${textMaterialTitle}    