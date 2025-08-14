*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${textMenuKardoosInstant}                                 xpath=//a[@href='/instant' and text()='Kardoos Instant']
${buttonEcoBlackPrintOnKardoosInstantPage}                xpath=//a/button[@class='button-eco']
${buttonFullColorPrintOnKardoosInstantPage}               xpath=//a/button[@class='button-color']

*** Keywords ***
user is on kardoos instant page
    Wait Until Element Is Visible        ${buttonEcoBlackPrintOnKardoosInstantPage}
    Element Should Be Visible            ${buttonEcoBlackPrintOnKardoosInstantPage}