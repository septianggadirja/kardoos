*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${buttonPengaturan}                         xpath=(//div[@class='pembatas']/preceding-sibling::div[@class='item-header'])[3]
${textMenungguPembayaranOndashboardPage}    xpath=//p[text()='Menunggu Pembayaran']

*** Keywords ***
user is on dashboard page
    Wait Until Element Is Visible        ${buttonPengaturan}
    Element Should Be Visible            ${buttonPengaturan}

user go to pengaturan page
    Wait Until Element Is Visible    ${buttonPengaturan}
    Click Element                    ${buttonPengaturan}

user go to kardoos instant order list page
    Wait Until Element Is Visible        ${textMenungguPembayaranOndashboardPage}
    Click Element                        ${textMenungguPembayaranOndashboardPage}
    