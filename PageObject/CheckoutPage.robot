*** Settings ***
Library        SeleniumLibrary
Library        String

*** Variables ***
${textCheckoutTitle}                          xpath=//p[text()='Checkout']
# ${textAddressNameOnCheckoutPage}              xpath=//label[@class='lbl-nama']/b
${textAddressNameOnCheckoutPage}              xpath=(//p[text()='Alamat Pengiriman']/following-sibling::div//div/p)[1]
${buttonGantiAlamatOnCheckoutPage}            xpath=//button[text()='Ganti Alamat']
${buttonPilihKurirOnCartPage}                 xpath=//button[text()='Pilih kurir']
${buttonGantiKurirOnCartPage}                 xpath=//button[text()='Ganti Kurir']
${dropdownExpressShippingOnCartPage}          xpath=//span/b[text()='Express']
${textShippingExpressOptionOnCheckoutPage}    xpath=(//span/b[text()='Express']/ancestor::h2/following-sibling::div//div/b)
${dropdownRegulerShippingOnCartPage}          xpath=//span/b[text()='Reguler']
${textShippingRegulerOptionOnCheckoutPage}    xpath=(//span/b[text()='Reguler']/ancestor::h2/following-sibling::div//div/b)
${dropdownSamedayShippingOnCartPage}          xpath=//span/b[text()='Sameday']
${textShippingSamedayOptionOnCheckoutPage}    xpath=(//span/b[text()='Sameday']/ancestor::h2/following-sibling::div//div/b)
${buttonTerapkanShippingOnCheckoutPage}       xpath=//label[text()='Pilih kurir favoritmu']/parent::div/following-sibling::div/button[text()='Terapkan']
${buttonLanjutBayarOnCheckoutPage}            xpath=//button[text()='Lanjut Bayar']
${textProductAmountOnCheckoutPage}            xpath=//p[contains(text(),'Produksi')]/following-sibling::div[1]/div[2]/p[1]
${textShippingFeeOnCheckoutPage}              xpath=//p[contains(text(),'Biaya Pengiriman')]/parent::div/following-sibling::div//p
${textTotalOnCheckoutPage}                    xpath=//p[text()='Total']/following-sibling::div/p
# ${radioListAlamatOnCheckoutPage}              xpath=(//input[@name='rdAlamat'])
${radioListAlamatOnCheckoutPage}              xpath=//button[text()='Ubah Alamat']/ancestor::div/div/label[contains(@class,'radio')]
${buttonTerapkanChangeAddressOnCheckoutPage}  xpath=//button[text()='Terapkan']
${inputQtyProductOnCheckoutPage}              xpath=//div[text()='Kuantiti']/following-sibling::div//input
${buttonPromoOnCheckoutPage}                  xpath=//button[contains(@class,'btnVoucher')]
${buttonResetPromoOnPopupVoucher}             xpath=//button[text()='Reset Promo']
${inputVoucherCodeOnPopupVoucher}             xpath=//input[@placeholder='Masukan Kode Voucher']
${buttonTerapkanOnPopupVoucher}               xpath=//button[text()='Terapkan']
${buttonLanjutTanpaPromoOnPopupVoucher}       xpath=//button/div[text()='Lanjut Tanpa Promo']
${buttonPakaiPromoOnPopupVoucher}             xpath=//button[contains(text(),'Pakai')]

*** Keywords ***
user is on checkout page
    Wait Until Element Is Visible    ${textCheckoutTitle}
    Element Should Be Visible        ${textCheckoutTitle}
    ${current_url}=    Get Location
    Log    Current URL: ${current_url}
    Should Contain    ${current_url}    /shipping

user click pilih kurir button on checkout page
    Wait Until Element Is Visible        ${buttonPilihKurirOnCartPage}    timeout=120
    Scroll Element Into View             ${buttonPilihKurirOnCartPage}
    Click Element                        ${buttonPilihKurirOnCartPage}

user click ganti kurir button on checkout page
    Wait Until Element Is Visible        ${buttonGantiKurirOnCartPage}
    Sleep    2
    Scroll Element Into View             ${buttonGantiKurirOnCartPage}
    Click Element                        ${buttonGantiKurirOnCartPage}

user choose shipping type express on checkout page
    Wait Until Element Is Visible    ${dropdownExpressShippingOnCartPage}
    Sleep    2
    Scroll Element Into View         ${dropdownExpressShippingOnCartPage}
    Click Element                    ${dropdownExpressShippingOnCartPage}

user choose shipping type reguler on checkout page
    Wait Until Element Is Visible    ${dropdownRegulerShippingOnCartPage}
    Scroll Element Into View         ${dropdownRegulerShippingOnCartPage}
    Click Element                    ${dropdownRegulerShippingOnCartPage}

user choose shipping type sameday on checkout page
    Wait Until Element Is Visible    ${dropdownSamedayShippingOnCartPage}
    Scroll Element Into View         ${dropdownSamedayShippingOnCartPage}
    Click Element                    ${dropdownSamedayShippingOnCartPage}

user choose shipping type on checkout page
    [Arguments]    ${ShippingType}
    # user click pilih kurir button on checkout page
    ${alreadyChooseKurir}                Run Keyword And Return Status            Wait Until Element Is Visible                    ${buttonGantiKurirOnCartPage}    timeout=120
    Run Keyword If                       '${alreadyChooseKurir}' == 'True'        user click ganti kurir button on checkout page
    ...  ELSE                            user click pilih kurir button on checkout page
    Wait Until Element Is Visible        ${buttonTerapkanShippingOnCheckoutPage}
    Run Keyword If                       '${ShippingType}' == 'Express'           user choose shipping type express on checkout page
    ...  ELSE IF                         '${ShippingType}' == 'Reguler'           user choose shipping type reguler on checkout page
    ...  ELSE                            user choose shipping type sameday on checkout page

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

user select shipping method sameday on checkout page
    Wait Until Element Is Visible        ${textShippingSamedayOptionOnCheckoutPage}
    ${totalshippingmethod}               Get Element Count                                       ${textShippingSamedayOptionOnCheckoutPage}
    ${random}                            Evaluate    random.randint(1, ${totalshippingmethod})   modules=random
    ${index}                             Catenate    [${random}]  
    Set Local Variable                   ${textShippingSamedayOptionOnCheckoutPage}              xpath=(//span/b[text()='Sameday']/ancestor::h2/following-sibling::div//div/b)${index}
    Scroll Element Into View             ${textShippingSamedayOptionOnCheckoutPage}
    Click Element                        ${textShippingSamedayOptionOnCheckoutPage}

user select shipping method on checkout page
    [Arguments]    ${ShippingType}
    Run Keyword If    '${ShippingType}' == 'Express'    user select shipping method express on checkout page
    ...  ELSE IF      '${ShippingType}' == 'Reguler'    user select shipping method reguler on checkout page
    ...  ELSE         user select shipping method sameday on checkout page

user click button terapkan shipping on checkout page
    Wait Until Element Is Visible        ${buttonTerapkanShippingOnCheckoutPage}
    Click Element                        ${buttonTerapkanShippingOnCheckoutPage}

user get choosen address on checkout page
    Sleep    5
    Wait Until Element Is Visible    ${textAddressNameOnCheckoutPage}
    ${addressname}                   Get Text                            ${textAddressNameOnCheckoutPage}
    Set Global Variable              ${AddressName}                      ${addressname}

user click button lanjut bayar on checkout page
    Wait Until Element Is Visible        ${buttonLanjutBayarOnCheckoutPage}
    Click Element                        ${buttonLanjutBayarOnCheckoutPage}

user go to dashboard from checkout page
    Sleep    5
    Go To    ${KARDOOS_DAHBOARD_URL}

user get total amount on checkout page
    Wait Until Element Is Visible        ${textProductAmountOnCheckoutPage}
    Sleep    5
    ${totalproductamount}                Get Text                            ${textProductAmountOnCheckoutPage}
    ${total_product_amount}              Remove String                       ${totalproductamount}                        Rp 
    ${total_product_amount_edit}=        Evaluate                            '''${total_product_amount}'''.strip()
    Log To Console                       ini total_product_amount ${total_product_amount_edit}
    Set Global Variable                  ${TotalProductAmount}               ${total_product_amount_edit}
    ${totalshipingamount}                Get Text                            ${textShippingFeeOnCheckoutPage}
    ${total_shipping_amount}             Remove String                       ${totalshipingamount}                        Rp 
    ${total_shipping_amount_edit}=       Evaluate                            '''${total_shipping_amount}'''.strip()
    Log To Console                       ini shipping_amount ${total_shipping_amount_edit}
    Set Global Variable                  ${TotalShippingAmount}              ${total_shipping_amount_edit}
    ${totalamount}                       Get Text                            ${textTotalOnCheckoutPage}
    ${total_amount}                      Remove String                       ${totalamount}                               Rp 
    ${total_amount_edit}=                Evaluate                            '''${total_amount}'''.strip()
    Log To Console                       ini total_amount ${total_amount_edit}
    Set Global Variable                  ${TotalAmount}                      ${total_amount_edit}

user click button ganti alamat on checkout page
    Wait Until Element Is Visible        ${buttonGantiAlamatOnCheckoutPage}
    Sleep    10
    Click Element                        ${buttonGantiAlamatOnCheckoutPage}

user choose shipping address on checkout page
    Wait Until Element Is Visible        ${radioListAlamatOnCheckoutPage}
    ${totalshippingaddress}              Get Element Count                                       ${radioListAlamatOnCheckoutPage}
    ${random}                            Evaluate    random.randint(2, ${totalshippingaddress})  modules=random
    ${index}                             Catenate    [${random}]  
    # Set Local Variable                   ${radioListAlamatOnCheckoutPage}                        xpath=(//input[@name='rdAlamat'])${index}
    Set Local Variable                   ${radioListAlamatOnCheckoutPage}                        xpath=(//button[text()='Ubah Alamat']/ancestor::div/div/label[contains(@class,'radio')])${index}
    Scroll Element Into View             ${radioListAlamatOnCheckoutPage}
    Click Element                        ${radioListAlamatOnCheckoutPage}

user click button terapkan for change address on checkout page
    Wait Until Element Is Visible        ${buttonTerapkanChangeAddressOnCheckoutPage}
    Click Element                        ${buttonTerapkanChangeAddressOnCheckoutPage}

user edit qty on checkout page
    Wait Until Element Is Visible    ${inputQtyProductOnCheckoutPage}
    Sleep    5
    Clear Element Text               ${inputQtyProductOnCheckoutPage}
    Sleep    5
    # Click Element                    ${inputQtyProductOnCheckoutPage}
    Input Text                       ${inputQtyProductOnCheckoutPage}    9

verify user should pilih kurir on checkout page
    Wait Until Element Is Visible        ${buttonPilihKurirOnCartPage}
    Element Should Be Visible            ${buttonPilihKurirOnCartPage}

user click cari promo to get popup voucher on checkout page
    Wait Until Element Is Visible        ${buttonPromoOnCheckoutPage}
    Click Element                        ${buttonPromoOnCheckoutPage}

user reset promo on checkout page
    ${havenotUsePromo}    Run Keyword And Return Status    Wait Until Element Is Visible        ${buttonLanjutTanpaPromoOnPopupVoucher}    timeout=5
    Run Keyword If        '${havenotUsePromo}'=='True'     Log To Console                       belum ada voucher yang digunakan
    ...    ELSE           Click Element                    ${buttonResetPromoOnPopupVoucher}

user input voucher code on checkout page
    Wait Until Element Is Visible            ${inputVoucherCodeOnPopupVoucher}
    Input Text                               ${inputVoucherCodeOnPopupVoucher}        KODENYAOTOMATIS
    Sleep    2
    Click Element                            ${buttonTerapkanOnPopupVoucher}

user apply voucher on checkout page
    Wait Until Element Is Visible        ${buttonPakaiPromoOnPopupVoucher}
    Click Element                        ${buttonPakaiPromoOnPopupVoucher}
    Sleep    2

user click button lanjut tanpa promo on checkout page
    Wait Until Element Is Visible        ${buttonLanjutTanpaPromoOnPopupVoucher}
    Click Element                        ${buttonLanjutTanpaPromoOnPopupVoucher}

user remove all promo on checkout page
    user click cari promo to get popup voucher on checkout page
    user reset promo on checkout page
    user click button lanjut tanpa promo on checkout page

user input voucher code for order
    user click cari promo to get popup voucher on checkout page
    user reset promo on checkout page
    user input voucher code on checkout page
    user apply voucher on checkout page