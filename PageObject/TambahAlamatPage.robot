*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${inputNamaLengkapOnAddAddressPage}        xpath=//input[@name='name']
${inputPhoneNumberOnAddAddressPage}        xpath=//input[@name='phoneNumber']
${inputCompanyNameOnAddAddressPage}        xpath=//input[@name='companyName']
${inputAddressOnAddAddressPage}            xpath=//textarea[@name='address']
${dropdownPropinsiOnAddAddressPage}        xpath=//label[text()='Propinsi']/following-sibling::div//div[text()='Select...']
${dropdownKabupatenOnAddAddressPage}       xpath=//label[text()='Kota / Kabupaten']/following-sibling::div//div[text()='Select...']
${dropdownKecamatanOnAddAddressPage}       xpath=//label[text()='Kecamatan']/following-sibling::div//div[text()='Select...']
${dropdownKelurahanOnAddAddressPage}       xpath=//label[text()='Kelurahan']/following-sibling::div//div[text()='Select...']
${inputKodePosOnAddAddressPage}            xpath=//input[@name='postalCode']
${buttonSimpanOnAddAddressPage}            xpath=//button[@type='submit']

*** Keywords ***
user is on tambah alamat page
    Wait Until Element Is Visible    ${buttonSimpanOnAddAddressPage}
    Element Should Be Visible        ${buttonSimpanOnAddAddressPage}

user input nama lengkap on tambah alamat page
    Wait Until Element Is Visible        ${inputNamaLengkapOnAddAddressPage}
    Input Text    ${inputNamaLengkapOnAddAddressPage}    test tambah alamat angga

user input nomor telepon on tambah alamat page
    Wait Until Element Is Visible        ${inputPhoneNumberOnAddAddressPage}
    Input Text    ${inputPhoneNumberOnAddAddressPage}    6295775533511

user input nama perusahaan on tambah alamat page
    Wait Until Element Is Visible        ${inputCompanyNameOnAddAddressPage}
    Input Text    ${inputCompanyNameOnAddAddressPage}    ini nama perusahaan

user input detail alamat on tambah alamat page
    Wait Until Element Is Visible    ${inputAddressOnAddAddressPage}
    Input Text    ${inputAddressOnAddAddressPage}    ini detail alamat

user choose propinsi on tambah alamat page
    Wait Until Element Is Visible        ${dropdownPropinsiOnAddAddressPage}
    Scroll Element Into View             ${dropdownPropinsiOnAddAddressPage}
    Click Element    ${dropdownPropinsiOnAddAddressPage}
    Press Keys    None     jakarta+RETURN

user choose kabupaten on tambah alamat page
    Wait Until Element Is Visible        ${dropdownKabupatenOnAddAddressPage}
    Scroll Element Into View             ${dropdownKabupatenOnAddAddressPage}
    Click Element    ${dropdownKabupatenOnAddAddressPage}
    Press Keys    None     timur+RETURN

user choose kecamatan on tambah alamat page
    Wait Until Element Is Visible        ${dropdownKecamatanOnAddAddressPage}
    Scroll Element Into View             ${dropdownKecamatanOnAddAddressPage}
    Click Element    ${dropdownKecamatanOnAddAddressPage}
    Press Keys    None     kramat+RETURN

user choose kelurahan on tambah alamat page
    Wait Until Element Is Visible        ${dropdownKelurahanOnAddAddressPage}
    Scroll Element Into View             ${dropdownKelurahanOnAddAddressPage}
    Click Element    ${dropdownKelurahanOnAddAddressPage}
    Press Keys    None     cililitan+RETURN
    Sleep    10

user input data on tambah alamat page
    user input nama lengkap on tambah alamat page
    user input nomor telepon on tambah alamat page
    user input nama perusahaan on tambah alamat page
    user input detail alamat on tambah alamat page
    user choose propinsi on tambah alamat page
    user choose kabupaten on tambah alamat page
    user choose kecamatan on tambah alamat page
    user choose kelurahan on tambah alamat page
