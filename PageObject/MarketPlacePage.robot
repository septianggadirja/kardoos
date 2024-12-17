*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${textMenuKardosMarketPlace}        xpath=//a[@href='/marketplace' and text()='Kardoos Marketplace']

*** Keywords ***
user is on marketplace page
    Wait Until Element Is Visible        ${textMenuKardosMarketPlace}
    Element Should Be Visible            ${textMenuKardosMarketPlace}