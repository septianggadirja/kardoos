*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${buttonAlamatPengiriman}            xpath=//button[text()='Alamat Pengiriman']
${buttonTambahAlamat}                xpath=//a[@href='/dashboard/pengaturan/tambah-alamat']

*** Keywords ***
user is on pengaturan page
    Wait Until Element Is Visible        ${buttonAlamatPengiriman}
    Element Should Be Visible            ${buttonAlamatPengiriman}

user open list alamat pengiriman 
    Wait Until Element Is Visible        ${buttonAlamatPengiriman}
    Click Element                        ${buttonAlamatPengiriman}

user go to tambah alamat page
    Wait Until Element Is Visible        ${buttonTambahAlamat}
    Click Element                        ${buttonTambahAlamat}