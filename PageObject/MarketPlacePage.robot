*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${textMenuKardosMarketPlace}                         xpath=//a[@href='/marketplace' and text()='Kardoos Marketplace']
${buttonMintaPenawaranHargaOnMarketPlacePage}        xpath=//button[text()='Minta Penawaran Harga']
${buttonPilihSekarangOnMarketPlacePage}              xpath=//button[text()='Pilih Sekarang!']
${buttonCariSekarangOnMarketPlacePage}               xpath=//button[text()='Cari Sekarang!']
${buttonCekSekarangOnMarketPlacePage}                xpath=//button[text()='Cek Sekarang!']
${buttonCobaSekarangOnMarketPlacePage}               xpath=//button[text()='Coba Sekarang!']

*** Keywords ***
user is on marketplace page
    Wait Until Element Is Visible        ${textMenuKardosMarketPlace}
    Element Should Be Visible            ${textMenuKardosMarketPlace}

user click button minta penawaran harga on marketplace page
    Wait Until Element Is Visible    ${buttonMintaPenawaranHargaOnMarketPlacePage}
    Scroll Element Into View         ${buttonMintaPenawaranHargaOnMarketPlacePage}
    Click Element                    ${buttonMintaPenawaranHargaOnMarketPlacePage}

user click button pilih sekarang on marketplace page
    Wait Until Element Is Visible    ${buttonPilihSekarangOnMarketPlacePage}
    Scroll Element Into View         ${buttonPilihSekarangOnMarketPlacePage}
    Click Element                    ${buttonPilihSekarangOnMarketPlacePage}

user click button cari sekarang on marketplace page
    Wait Until Element Is Visible    ${buttonCariSekarangOnMarketPlacePage}
    Scroll Element Into View         ${buttonCariSekarangOnMarketPlacePage}
    Click Element                    ${buttonCariSekarangOnMarketPlacePage}

user click button cek sekarang on marketplace page
    Wait Until Element Is Visible    ${buttonCekSekarangOnMarketPlacePage}
    Scroll Element Into View         ${buttonCekSekarangOnMarketPlacePage}
    Click Element                    ${buttonCekSekarangOnMarketPlacePage}

user click button coba sekarang on marketplace page
    Wait Until Element Is Visible    ${buttonCobaSekarangOnMarketPlacePage}
    Scroll Element Into View         ${buttonCobaSekarangOnMarketPlacePage}
    Click Element                    ${buttonCobaSekarangOnMarketPlacePage}