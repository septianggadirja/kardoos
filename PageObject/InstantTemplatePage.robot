*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${textMenuInstantTemplate}        xpath=//a[@href='/instant-template' and text()='Instant Template']

*** Keywords ***
user is on instant template page
    Wait Until Element Is Visible        ${textMenuInstantTemplate}
    Element Should Be Visible            ${textMenuInstantTemplate}