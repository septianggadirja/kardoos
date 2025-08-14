*** Settings ***
Resource    ../PageObject/HomePage.robot
Resource    ../PageObject/DashboardPage.robot
Resource    ../PageObject/PengaturanPage.robot
Resource    ../PageObject/TambahAlamatPage.robot
Resource    ../PageObject/UbahAlamatPage.robot

*** Keywords ***
Access tambah alamat page
    Given user is on home page
    When user go to dashboard page
    Then user is on dashboard page
    When user go to pengaturan page
    Then user is on pengaturan page
    When user open daftar alamat
    And user go to tambah alamat page
    Then user is on tambah alamat page

Tambah alamat pengiriman
    Given Access tambah alamat page
    When user input data on tambah alamat page
    And user click button simpan on tambah alamat page
    Then verify data after success add address

Access ubah alamat page
    Given user is on home page
    When user go to dashboard page
    Then user is on dashboard page
    When user go to pengaturan page
    Then user is on pengaturan page
    When user open daftar alamat
    And user go to ubah alamat page
    Then user is on ubah alamat page

Ubah alamat pengiriman
    Given Access ubah alamat page
    When user input data on ubah alamat page
    And user click button simpan on ubah alamat page
    Then verify data after success edit address

Hapus alamat pengiriman
    Given user is on home page
    When user go to dashboard page
    Then user is on dashboard page
    When user go to pengaturan page
    Then user is on pengaturan page
    When user open daftar alamat
    And user click hapus for delete address
    And user confirm to delete address
    Then verify data after success delete address