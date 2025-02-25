*** Settings ***
Library        SeleniumLibrary
Library        String

*** Variables ***
${textCheckoutTitle}                          xpath=//label[text()='Checkout']
${textAddressNameOnCheckoutPage}              xpath=//label[@class='lbl-nama']/b
${buttonGantiAlamatOnCheckoutPage}            xpath=//button[text()='Ganti Alamat']
${buttonPilihKurirOnCartPage}                 xpath=//button[text()='Pilih Kurir']
${buttonGantiKurirOnCartPage}                 xpath=//button[text()='Ganti Kurir']
${dropdownExpressShippingOnCartPage}          xpath=//span/b[text()='Express']
${textShippingExpressOptionOnCheckoutPage}    xpath=(//span/b[text()='Express']/ancestor::h2/following-sibling::div//div/b)
${dropdownRegulerShippingOnCartPage}          xpath=//span/b[text()='Reguler']
${textShippingRegulerOptionOnCheckoutPage}    xpath=(//span/b[text()='Reguler']/ancestor::h2/following-sibling::div//div/b)
${buttonTerapkanShippingOnCheckoutPage}       xpath=//label[text()='Pilih kurir favoritmu']/parent::div/following-sibling::div/button[text()='Terapkan']
${buttonLanjutBayarOnCheckoutPage}            xpath=//button[text()='Lanjut Bayar']
${textProductAmountOnCheckoutPage}            xpath=//div[@class='tipe-pesanan']/following-sibling::div[1]/div[@class='kanan']/label
${textShippingFeeOnCheckoutPage}              xpath=//label[text()='Biaya pengiriman']/parent::div/following-sibling::div/label
${textTotalOnCheckoutPage}                    xpath=//label[text()='Total']/parent::div/following-sibling::div/label
${radioListAlamatOnCheckoutPage}              xpath=(//input[@name='rdAlamat'])
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
    Wait Until Element Is Visible        ${buttonPilihKurirOnCartPage}
    Scroll Element Into View             ${buttonPilihKurirOnCartPage}
    Click Element                        ${buttonPilihKurirOnCartPage}

user click ganti kurir button on checkout page
    Wait Until Element Is Visible        ${buttonGantiKurirOnCartPage}
    Scroll Element Into View             ${buttonGantiKurirOnCartPage}
    Click Element                        ${buttonGantiKurirOnCartPage}

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
    # user click pilih kurir button on checkout page
    ${alreadyChooseKurir}                Run Keyword And Return Status            Wait Until Element Is Visible                    ${buttonGantiKurirOnCartPage}
    Run Keyword If                       '${alreadyChooseKurir}' == 'True'        user click ganti kurir button on checkout page
    ...  ELSE                            user click pilih kurir button on checkout page
    Wait Until Element Is Visible        ${buttonTerapkanShippingOnCheckoutPage}
    Run Keyword If                       '${ShippingType}' == 'Express'           user choose shipping type express on checkout page
    ...  ELSE                            user choose shipping type reguler on checkout page

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
    Click Element                        ${buttonGantiAlamatOnCheckoutPage}

user choose shipping address on checkout page
    Wait Until Element Is Visible        ${radioListAlamatOnCheckoutPage}
    ${totalshippingaddress}              Get Element Count                                       ${radioListAlamatOnCheckoutPage}
    ${random}                            Evaluate    random.randint(1, ${totalshippingaddress})  modules=random
    ${index}                             Catenate    [${random}]  
    Set Local Variable                   ${radioListAlamatOnCheckoutPage}                        xpath=(//input[@name='rdAlamat'])${index}
    Scroll Element Into View             ${radioListAlamatOnCheckoutPage}
    Click Element                        ${radioListAlamatOnCheckoutPage}

user click button terapkan for change address on checkout page
    Wait Until Element Is Visible        ${buttonTerapkanChangeAddressOnCheckoutPage}
    Click Element                        ${buttonTerapkanChangeAddressOnCheckoutPage}

user edit qty on checkout page
    Wait Until Element Is Visible    ${inputQtyProductOnCheckoutPage}
    Clear Element Text               ${inputQtyProductOnCheckoutPage}
    Sleep    2
    Input Text                       ${inputQtyProductOnCheckoutPage}    99

verify user should pilih kurir on checkout page
    Wait Until Element Is Visible        ${buttonPilihKurirOnCartPage}
    Element Should Be Visible            ${buttonPilihKurirOnCartPage}

user click cari promo to get popup voucher on checkout page
    Wait Until Element Is Visible        ${buttonPromoOnCheckoutPage}
    Click Element                        ${buttonPromoOnCheckoutPage}

user reset promo on checkout page
    ${havenotUsePromo}    Run Keyword And Return Status    Wait Until Element Is Visible        ${buttonLanjutTanpaPromoOnPopupVoucher}
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