*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${textMenuKardoosInstant}        xpath=//a[@href='/instant' and text()='Kardoos Instant']

*** Keywords ***
user is on kardoos instant page
    Wait Until Element Is Visible        ${textMenuKardoosInstant}
    Element Should Be Visible            ${textMenuKardoosInstant}