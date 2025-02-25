*** Settings ***
Library        SeleniumLibrary
Library        String

*** Variables ***
${buttonMenuModelOnDesignPage}                xpath=//button[@id='Model']
${textModelOptionOnDesignPage}                xpath=//h2[text()='Pilih Model Kardus']/following-sibling::div//div/p
${buttonMenuUkuranOnDesignPage}               xpath=//button[@id='Ukuran']
${buttonUkuranStandardOnDesignPage}           xpath=//h2[@type='button' and text()='Standard']
${buttonUkuranCustomOnDesignPage}             xpath=//h2[@type='button' and text()='Custom']
${inputLengthCustomOnDesignPage}              xpath=//input[@id='length']
${inputWidthCustomOnDesignPage}               xpath=//input[@id='width']
${inputHeightCustomOnDesignPage}              xpath=//input[@id='height']
${buttonApplyUkuranOnDesignPage}              xpath=//button[text()='Apply']
${buttonMaterialOnDesignPage}                 xpath=//button[@id='Material']
${buttonMaterialEcokraftBrownOnDesignPage}    xpath=//p[text()='EcoKraft - Brown']
${buttonMaterialEcokraftWhiteOnDesignPage}    xpath=//p[text()='EcoKraft - White']
${buttonMaterialPremiumWhiteOnDesignPage}     xpath=//p[text()='Premium White']
${textMaterialOptionOnDesignPage}             xpath=//h2[text()='EcoKraft']//parent::div/following-sibling::div//div/p
${buttonMenuImagesOnDesignPage}               xpath=//button[@id='Images']
${buttonTabMenuUploadImageOnDesignPage}       xpath=//h2[@type='button' and text()='Upload']
${imageDataUplodOnDesignPage}                 xpath=(//div[@id='upload-img']/parent::div/following-sibling::div//img)
${buttonTabMenuStockImageOnDesignPage}        xpath=//h2[@type='button' and text()='Stock']
${imageDataStockOnDesignPage}                 xpath=(//p[text()='Semua']/parent::div/parent::div/following-sibling::div//img)[1]
${textKecepatanProduksiOptionOnDesignPage}    xpath=//p[text()='Kecepatan Produksi']/following-sibling::div//span
${inputQtyOnDesignPage}                       xpath=//input[@id='quantityBox']                            
${textTotalOnDesignPage}                      xpath=//p[text()='Total']/following-sibling::p
${buttonKeranjangOnDesignPage}                xpath=//button[contains(text(),'Keranjang')]
${buttonPesanSekarangOnDesignPage}            xpath=//button[contains(text(),'Pesan Sekarang')]
${buttonInfoFinishingOnDesignPage}            xpath=//p[text()='Finishing']/div
${textPopupFinishingInformationOnDesignPage}  xpath=//p[text()='Finishing dengan kilau elegan, memberikan tampilan mewah dan menarik perhatian.']

*** Keywords ***
user is on design page 
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}
    Element Should Be Visible            ${buttonKeranjangOnDesignPage}

user choose model kardus 
    [Arguments]    ${ModelKardus}
    Wait Until Element Is Visible        ${textModelOptionOnDesignPage}
    Sleep    3
    Set Local Variable                   ${textModelOptionOnDesignPage}        xpath=//h2[text()='Pilih Model Kardus']/following-sibling::div//div/p[text()='${ModelKardus}']
    Scroll Element Into View             ${textModelOptionOnDesignPage}
    Wait Until Element Is Enabled        ${textModelOptionOnDesignPage}
    Set Global Variable                  ${ModelKardus}                        ${ModelKardus}
    Click Element                        ${textModelOptionOnDesignPage}
    Sleep    3

user choose tipe ukuran kardus
    [Arguments]    ${TipeUkuranKardus}
    Wait Until Element Is Visible    ${buttonMenuUkuranOnDesignPage}
    Sleep    3
    Click Element                    ${buttonMenuUkuranOnDesignPage}
    Run Keyword If                   '${TipeUkuranKardus}' == 'Standard'    Click Element    ${buttonUkuranStandardOnDesignPage}
    ...  ELSE                        Click Element                          ${buttonUkuranCustomOnDesignPage}

user input ukuran custom kardus
    [Arguments]    ${PanjangKardus}    ${LebarKardus}    ${TinggiKardus}
    Wait Until Element Is Visible    ${inputLengthCustomOnDesignPage}
    Clear Element Text               ${inputLengthCustomOnDesignPage}
    Sleep    2
    Set Global Variable              ${PanjangKardus}                    ${PanjangKardus}
    Input Text                       ${inputLengthCustomOnDesignPage}    ${PanjangKardus}
    Clear Element Text               ${inputWidthCustomOnDesignPage}
    Sleep    2
    Set Global Variable              ${LebarKardus}                      ${LebarKardus}
    Input Text                       ${inputWidthCustomOnDesignPage}     ${LebarKardus}
    Clear Element Text               ${inputHeightCustomOnDesignPage}
    Sleep    2
    Set Global Variable              ${TinggiKardus}                     ${TinggiKardus}
    Input Text                       ${inputHeightCustomOnDesignPage}    ${TinggiKardus}
    Wait Until Element Is Visible    ${buttonApplyUkuranOnDesignPage}
    Sleep    10
    Click Element                    ${buttonApplyUkuranOnDesignPage}
    Sleep    15

user choose ekocraft brown as material
    Wait Until Element Is Visible        ${buttonMaterialEcokraftBrownOnDesignPage}
    Scroll Element Into View             ${buttonMaterialEcokraftBrownOnDesignPage}
    Click Element                        ${buttonMaterialEcokraftBrownOnDesignPage}
    Sleep    5

user choose ekocraft white as material
    Wait Until Element Is Visible        ${buttonMaterialEcokraftWhiteOnDesignPage}
    Scroll Element Into View             ${buttonMaterialEcokraftWhiteOnDesignPage}
    Click Element                        ${buttonMaterialEcokraftWhiteOnDesignPage}
    Sleep    5

user choose premium white as material
    Wait Until Element Is Visible        ${buttonMaterialPremiumWhiteOnDesignPage}
    Scroll Element Into View             ${buttonMaterialPremiumWhiteOnDesignPage}
    Click Element                        ${buttonMaterialPremiumWhiteOnDesignPage}
    Sleep    5

user choose material kardus
    [Arguments]    ${MaterialTypeKardus}
    Wait Until Element Is Visible    ${buttonMaterialOnDesignPage}
    Set Global Variable              ${MaterialTypeKardus}                            ${MaterialTypeKardus}
    Click Element                    ${buttonMaterialOnDesignPage}
    Sleep    5
    Run Keyword If                   '${MaterialTypeKardus}' == 'EcoKraft - Brown'    user choose ekocraft brown as material
    ...  ELSE IF                     '${MaterialTypeKardus}' == 'EcoKraft - White'    user choose ekocraft white as material
    ...  ELSE                        user choose premium white as material

user choose bahan kardus
    [Arguments]    ${MaterialTypeKardus}    ${MaterialNameKardus}
    Sleep    5
    Set Local Variable                   ${textMaterialOptionOnDesignPage}        xpath=//h2[text()='${MaterialTypeKardus}']//parent::div/following-sibling::div//div/p[contains(text(),'${MaterialNameKardus}')]
    Wait Until Element Is Visible        ${textMaterialOptionOnDesignPage}
    Set Global Variable                  ${MaterialNameKardus}                    ${MaterialNameKardus}
    Click Element                        ${textMaterialOptionOnDesignPage}
    Sleep    5

user insert uploaded image for design
    Wait Until Element Is Visible        ${buttonMenuImagesOnDesignPage}
    Click Element                        ${buttonMenuImagesOnDesignPage}
    Wait Until Element Is Visible        ${buttonTabMenuUploadImageOnDesignPage}
    Click Element                        ${buttonTabMenuUploadImageOnDesignPage}
    Wait Until Element Is Visible        ${imageDataUplodOnDesignPage}
    Double Click Element                 ${imageDataUplodOnDesignPage}
    Sleep    15

user insert stock image for design
    Wait Until Element Is Visible        ${buttonMenuImagesOnDesignPage}
    Click Element                        ${buttonMenuImagesOnDesignPage}
    Wait Until Element Is Visible        ${buttonTabMenuStockImageOnDesignPage}
    Click Element                        ${buttonTabMenuStockImageOnDesignPage}
    Sleep    5
    Wait Until Element Is Visible        ${imageDataStockOnDesignPage}
    Double Click Element                 ${imageDataStockOnDesignPage}
    Sleep    10

user choose kecepatan produksi kardus
    [Arguments]    ${KecepatanProduksi}
    Sleep    5
    Wait Until Element Is Visible        ${textKecepatanProduksiOptionOnDesignPage}
    Set Global Variable                  ${KecepatanProduksi}                              ${KecepatanProduksi}
    Set Local Variable                   ${textKecepatanProduksiOptionOnDesignPage}        xpath=//p[text()='Kecepatan Produksi']/following-sibling::div//span[text()='${KecepatanProduksi}']
    Scroll Element Into View             ${textKecepatanProduksiOptionOnDesignPage}
    Click Element                        ${textKecepatanProduksiOptionOnDesignPage}
    Sleep    5

user input qty kardus
    [Arguments]    ${QtyKardus}
    Wait Until Element Is Visible        ${inputQtyOnDesignPage}
    Clear Element Text                   ${inputQtyOnDesignPage}
    Set Global Variable                  ${QtyKardus}               ${QtyKardus}
    Input Text                           ${inputQtyOnDesignPage}    ${QtyKardus}
    Sleep    10

user add design product
    [Arguments]    ${ModelKardus}    ${TipeUkuranKardus}    ${PanjangKardus}    ${LebarKardus}    ${TinggiKardus}    ${MaterialTypeKardus}    ${KecepatanProduksi}    ${QtyKardus}
    user choose model kardus    ${ModelKardus}
    user choose tipe ukuran kardus    ${TipeUkuranKardus}
    user input ukuran custom kardus    ${PanjangKardus}    ${LebarKardus}    ${TinggiKardus}
    user choose material kardus    ${MaterialTypeKardus}
    # user choose bahan kardus    ${MaterialTypeKardus}    ${MaterialNameKardus}
    # user insert uploaded image for design
    user insert stock image for design
    user choose kecepatan produksi kardus    ${KecepatanProduksi}
    user input qty kardus    ${QtyKardus}
    # user get total amount after design product
    Sleep    5

user get total amount after design product
    Wait Until Element Is Visible        ${textTotalOnDesignPage}
    ${totalproductamount}                Get Text                        ${textTotalOnDesignPage}
    ${total_product_amount}              Remove String                   ${totalproductamount}                        Rp 
    ${total_product_amount_edit}=        Evaluate                        '''${total_product_amount}'''.strip()
    Log To Console                       ini total_amount ${total_product_amount_edit}
    Set Global Variable                  ${TotalProductAmount}           ${total_product_amount_edit}

user click button keranjang on design page
    Wait Until Element Is Visible    ${buttonKeranjangOnDesignPage}
    Sleep    5
    Click Element                    ${buttonKeranjangOnDesignPage}

user click button pesan sekarang 
    Wait Until Element Is Visible    ${buttonPesanSekarangOnDesignPage}
    Sleep    5
    Click Element                    ${buttonPesanSekarangOnDesignPage}

user is on design page with material brown selected
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}
    ${current_url}=    Get Location
    Log                Current URL: ${current_url}
    Should Contain     ${current_url}                    brown

user is on design page with material fullcolor selected
    Sleep    5
    # Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}
    ${current_url}=    Get Location
    Log                Current URL: ${current_url}
    Should Contain     ${current_url}                    fullcolor

user is on design page with model mailer selected
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}
    ${current_url}=    Get Location
    Log                Current URL: ${current_url}
    Should Contain     ${current_url}                    mailer

user is on design page with model shipping selected
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}
    ${current_url}=    Get Location
    Log                Current URL: ${current_url}
    Should Contain     ${current_url}                    thedoos

user is on design page with model goodiebox selected
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}
    ${current_url}=    Get Location
    Log                Current URL: ${current_url}
    Should Contain     ${current_url}                    goodiebox

user click button info finishing on design page
    Wait Until Element Is Visible        ${buttonInfoFinishingOnDesignPage}
    Click Element                        ${buttonInfoFinishingOnDesignPage}

user get information about finishing premium white on deesign page 
    Wait Until Element Is Visible        ${textPopupFinishingInformationOnDesignPage}
    Element Should Be Visible            ${textPopupFinishingInformationOnDesignPage}