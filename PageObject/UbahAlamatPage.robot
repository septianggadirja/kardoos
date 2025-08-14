*** Settings ***
Library    SeleniumLibrary
Library    DateTime

*** Variables ***
${inputNamaLengkapOnEditAddressPage}                xpath=//input[@name='name']
${inputPhoneNumberOnEditAddressPage}                xpath=//input[@name='phoneNumber']
${inputCompanyNameOnEditAddressPage}                xpath=//input[@name='companyName']
${inputAddressOnEditAddressPage}                    xpath=//textarea[@name='address']
${inputProvinceCityDistrictOnEditAddressPage}       xpath=//input[@placeholder='Pilih berdasarkan Provinsi, Kota, Kecamatan']
${dropdownProvinceCityDistrictOnEditAddressPage}    xpath=//div[@class='pac-container pac-logo hdpi']//span[@class='pac-matched']
${inputKodePosOnEditAddressPage}                    xpath=//input[@name='postalCode']
${buttonSimpanOnEditAddressPage}                    xpath=//button[contains(text(),'Simpan')]

*** Keywords ***
user is on ubah alamat page
    Wait Until Element Is Visible    ${inputNamaLengkapOnEditAddressPage}
    Element Should Be Visible        ${inputNamaLengkapOnEditAddressPage}

user input nama lengkap on ubah alamat page
    Wait Until Element Is Visible        ${inputNamaLengkapOnEditAddressPage}
    Clear Element Text                   ${inputNamaLengkapOnEditAddressPage}
    ${current_date}                      Get Current Date                        result_format=%d/%m/%Y
    ${current_time}                      Get Current Date                        result_format=%H%M%S
    Log To Console                       ini waktu ${current_date} dan ${current_time}
    Set Global Variable                  ${AddressFullName}    address automation ${current_date} ${current_time}
    Log To Console                       ini fullname ${AddressFullName}
    Input Text                           ${inputNamaLengkapOnEditAddressPage}     ${AddressFullName}

user input nomor telepon on ubah alamat page
    Wait Until Element Is Visible        ${inputPhoneNumberOnEditAddressPage}
    Clear Element Text                   ${inputPhoneNumberOnEditAddressPage}
    Input Text                           ${inputPhoneNumberOnEditAddressPage}    6285775533511

user input nama perusahaan on ubah alamat page
    Wait Until Element Is Visible        ${inputCompanyNameOnEditAddressPage}
    Clear Element Text                   ${inputCompanyNameOnEditAddressPage}
    Input Text                           ${inputCompanyNameOnEditAddressPage}    ini nama perusahaan

user input detail alamat on ubah alamat page
    Wait Until Element Is Visible        ${inputAddressOnEditAddressPage}
    Clear Element Text                   ${inputAddressOnEditAddressPage}
    ${current_date}                      Get Current Date                        result_format=%d/%m/%Y
    ${current_time}                      Get Current Date                        result_format=%H%M%S
    Log To Console                       ini waktu ${current_date} dan ${current_time}
    Set Global Variable                  ${AddressDetail}    automation street ${current_date} ${current_time}
    Input Text                           ${inputAddressOnEditAddressPage}         ${AddressDetail}

user input nama lokasi on ubah alamat page
    Wait Until Element Is Visible        ${inputProvinceCityDistrictOnEditAddressPage}
    Clear Element Text                   ${inputProvinceCityDistrictOnEditAddressPage}
    Input Text                           ${inputProvinceCityDistrictOnEditAddressPage}    lebak bulus

user choose location suggestion on ubah alamat page
    Wait Until Element Is Visible        ${dropdownProvinceCityDistrictOnEditAddressPage}
    ${totalsuggestion}                   Get Element Count                                  ${dropdownProvinceCityDistrictOnEditAddressPage}
    ${random}                            Evaluate    random.randint(1, ${totalsuggestion})  modules=random
    ${index}                             Catenate                                           [${random}]  
    Set Local Variable                   ${dropdownProvinceCityDistrictOnEditAddressPage}    xpath=(//div[@class='pac-container pac-logo hdpi']//span[@class='pac-matched'])${index}
    Scroll Element Into View             ${dropdownProvinceCityDistrictOnEditAddressPage}
    Click Element                        ${dropdownProvinceCityDistrictOnEditAddressPage}

user input postal code on ubah alamat page
    Wait Until Element Is Visible        ${inputKodePosOnEditAddressPage}
    Scroll Element Into View             ${inputKodePosOnEditAddressPage}
    Clear Element Text                   ${inputKodePosOnEditAddressPage}
    Sleep    2
    Input Text                           ${inputKodePosOnEditAddressPage}    12440

user click button simpan on ubah alamat page
    Wait Until Element Is Visible        ${buttonSimpanOnEditAddressPage}
    Scroll Element Into View             ${buttonSimpanOnEditAddressPage}
    Click Element                        ${buttonSimpanOnEditAddressPage}

user input data on ubah alamat page
    user input nama lengkap on ubah alamat page
    user input nomor telepon on ubah alamat page
    user input nama perusahaan on ubah alamat page
    user input detail alamat on ubah alamat page
    user input nama lokasi on ubah alamat page
    user choose location suggestion on ubah alamat page
    user input postal code on ubah alamat page