*** Settings ***
Resource    ../PageObject/HomePage.robot
Resource    ../PageObject/DashboardPage.robot
Resource    ../PageObject/PengaturanPage.robot
Resource    ../PageObject/TambahAlamatPage.robot

*** Keywords ***
Access tambah alamat page
    Given user is on home page
    When user go to dashboard page
    Then user is on dashboard page
    When user go to pengaturan page
    Then user is on pengaturan page
    When user open list alamat pengiriman
    And user go to tambah alamat page
    Then user is on tambah alamat page

user tambah alamat pengiriman
    Given Access tambah alamat page
    When user input data on tambah alamat page