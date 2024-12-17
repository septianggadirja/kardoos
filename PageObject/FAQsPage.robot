*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${textFAQTilte}            xpath=//h1[text()='Frequently Asked Questions']

*** Keywords ***
user is on FAQs page
    Wait Until Element Is Visible        ${textFAQTilte}
    Element Should Be Visible            ${textFAQTilte}