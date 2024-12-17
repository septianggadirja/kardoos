*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${textSyaratKetentuanTitle}        xpath=//div[@class='top-header']/label[text()='Syarat dan Ketentuan']

*** Keywords ***
user is on syarat & ketentuan page
    Wait Until Element Is Visible        ${textSyaratKetentuanTitle}
    Element Should Be Visible            ${textSyaratKetentuanTitle}    