*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${textCompanyNameOnInspirasiPage}        xpath=//div[@class='inspiration-company']
${textPersonNameOnInspirasiPage}         xpath=//div[@class='inspiration-person']

*** Keywords ***
user is on inspirasi page
    Wait Until Element Is Visible        ${textCompanyNameOnInspirasiPage}
    Element Should Be Visible            ${textCompanyNameOnInspirasiPage}
    Element Should Be Visible            ${textPersonNameOnInspirasiPage}    