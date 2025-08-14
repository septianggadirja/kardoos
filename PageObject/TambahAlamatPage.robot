*** Settings ***
Library    SeleniumLibrary
Library    DateTime

*** Variables ***
${inputNamaLengkapOnAddAddressPage}                xpath=//input[@name='name']
${inputPhoneNumberOnAddAddressPage}                xpath=//input[@name='phoneNumber']
${inputCompanyNameOnAddAddressPage}                xpath=//input[@name='companyName']
${inputAddressOnAddAddressPage}                    xpath=//textarea[@name='address']
${inputProvinceCityDistrictOnAddAddressPage}       xpath=//input[@placeholder='Pilih berdasarkan Provinsi, Kota, Kecamatan']
${dropdownProvinceCityDistrictOnAddAddressPage}    xpath=(//div[@class='pac-container pac-logo hdpi']/div[@class='pac-item']//span[@class='pac-matched'])
# ${dropdownPropinsiOnAddAddressPage}        xpath=//label[text()='Propinsi']/following-sibling::div//div[text()='Select...']
# ${dropdownKabupatenOnAddAddressPage}       xpath=//label[text()='Kota / Kabupaten']/following-sibling::div//div[text()='Select...']
# ${dropdownKecamatanOnAddAddressPage}       xpath=//label[text()='Kecamatan']/following-sibling::div//div[text()='Select...']
# ${dropdownKelurahanOnAddAddressPage}       xpath=//label[text()='Kelurahan']/following-sibling::div//div[text()='Select...']
${inputKodePosOnAddAddressPage}                    xpath=//input[@name='postalCode']
${buttonSimpanOnAddAddressPage}                    xpath=//button[contains(text(),'Simpan')]

*** Keywords ***
user is on tambah alamat page
    Wait Until Element Is Visible    ${inputNamaLengkapOnAddAddressPage}
    Element Should Be Visible        ${inputNamaLengkapOnAddAddressPage}

user input nama lengkap on tambah alamat page
    Wait Until Element Is Visible        ${inputNamaLengkapOnAddAddressPage}
    ${current_date}                      Get Current Date                        result_format=%d/%m/%Y
    ${current_time}                      Get Current Date                        result_format=%H%M%S
    Log To Console                       ini waktu ${current_date} dan ${current_time}
    Set Global Variable                  ${AddressFullName}    address automation ${current_date} ${current_time}
    Log To Console                       ini fullname ${AddressFullName}
    Input Text                           ${inputNamaLengkapOnAddAddressPage}     ${AddressFullName}

user input nomor telepon on tambah alamat page
    Wait Until Element Is Visible        ${inputPhoneNumberOnAddAddressPage}
    Input Text                           ${inputPhoneNumberOnAddAddressPage}    6285775533511

user input nama perusahaan on tambah alamat page
    Wait Until Element Is Visible        ${inputCompanyNameOnAddAddressPage}
    Input Text                           ${inputCompanyNameOnAddAddressPage}    ini nama perusahaan

user input detail alamat on tambah alamat page
    Wait Until Element Is Visible        ${inputAddressOnAddAddressPage}
    ${current_date}                      Get Current Date                        result_format=%d/%m/%Y
    ${current_time}                      Get Current Date                        result_format=%H%M%S
    Log To Console                       ini waktu ${current_date} dan ${current_time}
    Set Global Variable                  ${AddressDetail}    automation street ${current_date} ${current_time}
    Input Text                           ${inputAddressOnAddAddressPage}         ${AddressDetail}

# user choose propinsi on tambah alamat page
#     Wait Until Element Is Visible        ${dropdownPropinsiOnAddAddressPage}
#     Scroll Element Into View             ${dropdownPropinsiOnAddAddressPage}
#     Click Element    ${dropdownPropinsiOnAddAddressPage}
#     Press Keys    None     jakarta+RETURN

# user choose kabupaten on tambah alamat page
#     Wait Until Element Is Visible        ${dropdownKabupatenOnAddAddressPage}
#     Scroll Element Into View             ${dropdownKabupatenOnAddAddressPage}
#     Click Element    ${dropdownKabupatenOnAddAddressPage}
#     Press Keys    None     timur+RETURN

# user choose kecamatan on tambah alamat page
#     Wait Until Element Is Visible        ${dropdownKecamatanOnAddAddressPage}
#     Scroll Element Into View             ${dropdownKecamatanOnAddAddressPage}
#     Click Element    ${dropdownKecamatanOnAddAddressPage}
#     Press Keys    None     kramat+RETURN

# user choose kelurahan on tambah alamat page
#     Wait Until Element Is Visible        ${dropdownKelurahanOnAddAddressPage}
#     Scroll Element Into View             ${dropdownKelurahanOnAddAddressPage}
#     Click Element    ${dropdownKelurahanOnAddAddressPage}
#     Press Keys    None     cililitan+RETURN
#     Sleep    10

user input nama lokasi on tambah alamat page
    Wait Until Element Is Visible        ${inputProvinceCityDistrictOnAddAddressPage}
    Clear Element Text                   ${inputProvinceCityDistrictOnAddAddressPage}
    Input Text                           ${inputProvinceCityDistrictOnAddAddressPage}    pasar minggu

user choose location suggestion on tambah alamat page
    Sleep    10
    Wait Until Element Is Visible        ${dropdownProvinceCityDistrictOnAddAddressPage}
    ${totalsuggestion}                   Get Element Count                                  ${dropdownProvinceCityDistrictOnAddAddressPage}
    ${random}                            Evaluate    random.randint(1, ${totalsuggestion})  modules=random
    ${index}                             Catenate                                           [${random}]  
    Set Local Variable                   ${dropdownProvinceCityDistrictOnAddAddressPage}    xpath=(//div[@class='pac-container pac-logo hdpi']/div[@class='pac-item'])${index}
    Scroll Element Into View             ${dropdownProvinceCityDistrictOnAddAddressPage}
    Click Element                        ${dropdownProvinceCityDistrictOnAddAddressPage}

user input postal code on tambah alamat page
    Wait Until Element Is Visible        ${inputKodePosOnAddAddressPage}
    Scroll Element Into View             ${inputKodePosOnAddAddressPage}
    Clear Element Text                   ${inputKodePosOnAddAddressPage}
    Sleep    2
    Input Text                           ${inputKodePosOnAddAddressPage}    12520

user click button simpan on tambah alamat page
    Wait Until Element Is Visible        ${buttonSimpanOnAddAddressPage}
    Scroll Element Into View             ${buttonSimpanOnAddAddressPage}
    Click Element                        ${buttonSimpanOnAddAddressPage}

user input data on tambah alamat page
    user input nama lengkap on tambah alamat page
    user input nomor telepon on tambah alamat page
    user input nama perusahaan on tambah alamat page
    user input detail alamat on tambah alamat page
    # user choose propinsi on tambah alamat page
    # user choose kabupaten on tambah alamat page
    # user choose kecamatan on tambah alamat page
    # user choose kelurahan on tambah alamat page
    user input nama lokasi on tambah alamat page
    user choose location suggestion on tambah alamat page
    user input postal code on tambah alamat page