*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${buttonProfilSaya}                  xpath=//button[text()='Profil Saya']
${buttonGantiPassword}               xpath=//button[text()='Ganti Password']
${buttonDaftarAlamat}                xpath=//button[text()='Daftar Alamat']
${buttonTambahAlamat}                xpath=//a[@href='/dashboard/pengaturan/tambah-alamat']

*** Keywords ***
user is on pengaturan page
    Wait Until Element Is Visible        ${buttonProfilSaya}
    Element Should Be Visible            ${buttonProfilSaya}

user open profil saya 
    Wait Until Element Is Visible        ${buttonProfilSaya}
    Click Element                        ${buttonProfilSaya}

user open ganti password 
    Wait Until Element Is Visible        ${buttonGantiPassword}
    Click Element                        ${buttonGantiPassword}

user open daftar alamat 
    Wait Until Element Is Visible        ${buttonDaftarAlamat}
    Click Element                        ${buttonDaftarAlamat}

user go to tambah alamat page
    Wait Until Element Is Visible        ${buttonTambahAlamat}
    Scroll Element Into View             ${buttonTambahAlamat}
    Click Element                        ${buttonTambahAlamat}

verify data after success add address
    Set Local Variable                   ${textFullNameOnAddressList}         xpath=//span[text()='Alamat Utama']/ancestor::div//div//p[contains(text(),'${AddressFullName}')]
    Set Local Variable                   ${textPhoneNoOnAddressList}          xpath=//span[text()='Alamat Utama']/ancestor::div//div//p[contains(text(),'6285775533511')]
    Set Local Variable                   ${textAddressDetailOnAddressList}    xpath=//span[text()='Alamat Utama']/ancestor::div//div//p[contains(text(),'${AddressDetail}')]
    Wait Until Element Is Visible        ${textFullNameOnAddressList}
    Element Should Be Visible            ${textFullNameOnAddressList}
    Element Should Be Visible            ${textPhoneNoOnAddressList}
    Element Should Be Visible            ${textAddressDetailOnAddressList}

user go to ubah alamat page
    Set Local Variable                   ${buttonUbahAlamat}        xpath=(//p[contains(text(),'address automation')]/parent::div/following-sibling::div/button[text()='Ubah'])[1]
    Wait Until Element Is Visible        ${buttonUbahAlamat}
    Scroll Element Into View             ${buttonUbahAlamat}
    Click Element                        ${buttonUbahAlamat}   

verify data after success edit address
    Set Local Variable                   ${textFullNameOnAddressList}         xpath=//span[text()='Alamat Utama']/ancestor::div//div//p[contains(text(),'${AddressFullName}')]
    Set Local Variable                   ${textPhoneNoOnAddressList}          xpath=//span[text()='Alamat Utama']/ancestor::div//div//p[contains(text(),'6285775533511')]
    Set Local Variable                   ${textAddressDetailOnAddressList}    xpath=//span[text()='Alamat Utama']/ancestor::div//div//p[contains(text(),'${AddressDetail}')]
    Wait Until Element Is Visible        ${textFullNameOnAddressList}
    Element Should Be Visible            ${textFullNameOnAddressList}
    Element Should Be Visible            ${textPhoneNoOnAddressList}
    Element Should Be Visible            ${textAddressDetailOnAddressList}

user click hapus for delete address
    Set Local Variable                    ${textFullNameOnAddressList}    xpath=(//span[text()='Alamat Utama']/ancestor::div//div//p[contains(text(),'address automation')])
    Set Local Variable                    ${textHapusOnAddressList}       xpath=(//span[text()='Alamat Utama']/ancestor::div//div//p[contains(text(),'address automation')]/parent::div/following-sibling::div/button[text()='Hapus'])
    Wait Until Element Is Visible         ${textHapusOnAddressList}
    ${totaladdress}                       Get Element Count               ${textFullNameOnAddressList}
    ${random}                             Evaluate    random.randint(1, ${totaladdress})  modules=random
    ${index}                              Catenate                        [${random}]  
    Set Local Variable                    ${textFullNameOnAddressList}    xpath=(//span[text()='Alamat Utama']/ancestor::div//div//p[contains(text(),'address automation')])${index}
    Set Local Variable                    ${textHapusOnAddressList}       xpath=(//span[text()='Alamat Utama']/ancestor::div//div//p[contains(text(),'address automation')]/parent::div/following-sibling::div/button[text()='Hapus'])${index}
    ${deletedfullnameaddress}             Get Text                        ${textFullNameOnAddressList}
    Set Global Variable                   ${DeletedFullNameAddress}       ${deletedfullnameaddress}
    Scroll Element Into View              ${textHapusOnAddressList}
    Click Element                         ${textHapusOnAddressList}

user confirm to delete address
    Set Local Variable                    ${buttonConfirmDeleteAddress}    xpath=//p[text()='Hapus Alamat']/following-sibling::div/button[text()='Hapus']
    Wait Until Element Is Visible         ${buttonConfirmDeleteAddress}
    Click Element                         ${buttonConfirmDeleteAddress}

verify data after success delete address
    Set Local Variable                   ${textFullNameOnAddressList}         xpath=//span[text()='Alamat Utama']/ancestor::div//div//p[contains(text(),'${DeletedFullNameAddress}')]
    Wait Until Element Is Not Visible    ${textFullNameOnAddressList}
    Element Should Not Be Visible        ${textFullNameOnAddressList}