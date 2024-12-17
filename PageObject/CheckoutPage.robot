*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${textCheckoutTitle}                          xpath=//label[text()='Checkout']
${textAddressNameOnCheckoutPage}              xpath=//label[@class='lbl-nama']/b
${buttonGantiAlamatOnCheckoutPage}            xpath=//button[text()='Ganti Alamat']
${buttonPilihKurirOnCartPage}                 xpath=//button[text()='Pilih Kurir']
${dropdownExpressShippingOnCartPage}          xpath=//span/b[text()='Express']
${textShippingExpressOptionOnCheckoutPage}    xpath=(//span/b[text()='Express']/ancestor::h2/following-sibling::div//div/b)
${dropdownRegulerShippingOnCartPage}          xpath=//span/b[text()='Reguler']
${textShippingRegulerOptionOnCheckoutPage}    xpath=(//span/b[text()='Reguler']/ancestor::h2/following-sibling::div//div/b)
${buttonTerapkanShippingOnCheckoutPage}       xpath=//label[text()='Pilih kurir favoritmu']/parent::div/following-sibling::div/button[text()='Terapkan']
${buttonLanjutBayarOnCheckoutPage}            xpath=//button[text()='Lanjut Bayar']

*** Keywords ***
user is on checkout page
    Wait Until Element Is Visible    ${textCheckoutTitle}
    Element Should Be Visible        ${textCheckoutTitle}
    ${current_url}=    Get Location
    Log    Current URL: ${current_url}
    Should Contain    ${current_url}    /shipping

user click pilih kurir button on checkout page
    Wait Until Element Is Visible        ${buttonPilihKurirOnCartPage}
    Scroll Element Into View             ${buttonPilihKurirOnCartPage}
    Click Element                        ${buttonPilihKurirOnCartPage}

user choose shipping type express on checkout page
    Wait Until Element Is Visible    ${dropdownExpressShippingOnCartPage}
    Scroll Element Into View         ${dropdownExpressShippingOnCartPage}
    Click Element                    ${dropdownExpressShippingOnCartPage}

user choose shipping type reguler on checkout page
    Wait Until Element Is Visible    ${dropdownRegulerShippingOnCartPage}
    Scroll Element Into View         ${dropdownRegulerShippingOnCartPage}
    Click Element                    ${dropdownRegulerShippingOnCartPage}

user choose shipping type on checkout page
    [Arguments]    ${ShippingType}
    user click pilih kurir button on checkout page
    Wait Until Element Is Visible        ${buttonTerapkanShippingOnCheckoutPage}
    Run Keyword If    '${ShippingType}' == 'Express'    user choose shipping type express on checkout page
    ...  ELSE    user choose shipping type reguler on checkout page

user select shipping method express on checkout page
    Wait Until Element Is Visible        ${textShippingExpressOptionOnCheckoutPage}
    ${totalshippingmethod}               Get Element Count                                       ${textShippingExpressOptionOnCheckoutPage}
    ${random}                            Evaluate    random.randint(1, ${totalshippingmethod})   modules=random
    ${index}                             Catenate    [${random}]  
    Set Local Variable                   ${textShippingExpressOptionOnCheckoutPage}              xpath=(//span/b[text()='Express']/ancestor::h2/following-sibling::div//div/b)${index}
    Scroll Element Into View             ${textShippingExpressOptionOnCheckoutPage}
    Click Element                        ${textShippingExpressOptionOnCheckoutPage}

user select shipping method reguler on checkout page
    Wait Until Element Is Visible        ${textShippingRegulerOptionOnCheckoutPage}
    ${totalshippingmethod}               Get Element Count                                       ${textShippingRegulerOptionOnCheckoutPage}
    ${random}                            Evaluate    random.randint(1, ${totalshippingmethod})   modules=random
    ${index}                             Catenate    [${random}]  
    Set Local Variable                   ${textShippingRegulerOptionOnCheckoutPage}              xpath=(//span/b[text()='Reguler']/ancestor::h2/following-sibling::div//div/b)${index}
    Scroll Element Into View             ${textShippingRegulerOptionOnCheckoutPage}
    Click Element                        ${textShippingRegulerOptionOnCheckoutPage}

user select shipping method on checkout page
    [Arguments]    ${ShippingType}
    Run Keyword If    '${ShippingType}' == 'Express'    user select shipping method express on checkout page
    ...  ELSE         user select shipping method reguler on checkout page

user click button terapkan shipping on checkout page
    Wait Until Element Is Visible        ${buttonTerapkanShippingOnCheckoutPage}
    Click Element                        ${buttonTerapkanShippingOnCheckoutPage}

user get choosen address on checkout page
    Wait Until Element Is Visible    ${textAddressNameOnCheckoutPage}
    ${addressname}                   Get Text                            ${textAddressNameOnCheckoutPage}
    Set Global Variable              ${AddressName}                      ${addressname}

user click button lanjut bayar on checkout page
    Wait Until Element Is Visible        ${buttonLanjutBayarOnCheckoutPage}
    Click Element                        ${buttonLanjutBayarOnCheckoutPage}

user go to dashboard from checkout page
    Go To    ${KARDOOS_DAHBOARD_URL}