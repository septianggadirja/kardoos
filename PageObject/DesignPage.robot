*** Settings ***
Library        SeleniumLibrary
Library        String

*** Variables ***
${buttonMenuModelOnDesignPage}                xpath=//button[@id='Model']
${textModelOptionOnDesignPage}                xpath=//h2[text()='Pilih Model Kardus']/parent::div/following-sibling::div//div/p[1]
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
${buttonKeranjangOnDesignPage}                xpath=//div[@id='proses-keranjang']/button[text()='+ Keranjang']
${buttonPesanSekarangOnDesignPage}            xpath=//div[@id='proses-keranjang']/button[text()='Pesan Sekarang']
${buttonInfoFinishingOnDesignPage}            xpath=//p[text()='Finishing']/div
${textPopupFinishingInformationOnDesignPage}  xpath=//p[text()='Finishing dengan kilau elegan, memberikan tampilan mewah dan menarik perhatian.']
${iconBoxColorOptionOnDesignPage}             xpath=//img[@alt='box color material kardoos']
${inputHexColorValueOnDesignPage}             xpath=//input[@id='rc-editable-input-1']
${iconChoosenBoxColorOnDesignPage}            xpath=//img[@alt='box color material kardoos']/parent::div/following-sibling::div
${radioGlossyOnDesignPage}                    xpath=//span[contains(@class,'radio') and text()='Glossy']
${radioDoffOnDesignPage}                      xpath=//span[contains(@class,'radio') and text()='Doff']
${radioSingleWallOnDesignPage}                xpath=//label/span[text()='Single Wall']
${radioDoubleWallOnDesignPage}                xpath=//label/span[text()='Double Wall']

*** Keywords ***
user is on design page 
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}    
    Element Should Be Visible            ${buttonKeranjangOnDesignPage}

user choose model kardus 
    [Arguments]    ${ModelKardus}
    Sleep    10
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}   
    Wait Until Element Is Visible        ${textModelOptionOnDesignPage}
    # Sleep    3
    Set Local Variable                   ${textModelOptionOnDesignPage}        xpath=//h2[text()='Pilih Model Kardus']/parent::div/following-sibling::div//div/p[1][text()='${ModelKardus}']
    Scroll Element Into View             ${textModelOptionOnDesignPage}
    Wait Until Element Is Enabled        ${textModelOptionOnDesignPage}
    Set Global Variable                  ${ModelKardus}                        ${ModelKardus}
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}    
    Click Element                        ${textModelOptionOnDesignPage}
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}        

user choose tipe ukuran kardus
    [Arguments]    ${TipeUkuranKardus}
    Sleep    10
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}  
    Wait Until Element Is Visible    ${buttonMenuUkuranOnDesignPage}  
    Click Element                    ${buttonMenuUkuranOnDesignPage}
    Run Keyword If                   '${TipeUkuranKardus}' == 'Standard'    Click Element    ${buttonUkuranStandardOnDesignPage}
    ...  ELSE                        Click Element                          ${buttonUkuranCustomOnDesignPage}

user input ukuran custom kardus
    [Arguments]    ${PanjangKardus}    ${LebarKardus}    ${TinggiKardus}
    Sleep    10
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}  
    Wait Until Element Is Visible    ${inputLengthCustomOnDesignPage}
    Clear Element Text               ${inputLengthCustomOnDesignPage}
    # Sleep    2
    Set Global Variable              ${PanjangKardus}                    ${PanjangKardus}
    Input Text                       ${inputLengthCustomOnDesignPage}    ${PanjangKardus}
    Clear Element Text               ${inputWidthCustomOnDesignPage}
    # Sleep    2
    Set Global Variable              ${LebarKardus}                      ${LebarKardus}
    Input Text                       ${inputWidthCustomOnDesignPage}     ${LebarKardus}
    Clear Element Text               ${inputHeightCustomOnDesignPage}
    # Sleep    2
    Set Global Variable              ${TinggiKardus}                     ${TinggiKardus}
    Input Text                       ${inputHeightCustomOnDesignPage}    ${TinggiKardus}
    Wait Until Element Is Visible    ${buttonApplyUkuranOnDesignPage}
    Sleep    10
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}    
    Click Element                    ${buttonApplyUkuranOnDesignPage}
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}    

user choose ekocraft brown as material  
    Sleep    5  
    Wait Until Element Is Visible        ${buttonMaterialEcokraftBrownOnDesignPage}
    Scroll Element Into View             ${buttonMaterialEcokraftBrownOnDesignPage}
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}    
    Click Element                        ${buttonMaterialEcokraftBrownOnDesignPage}
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}    

user choose ekocraft white as material
    Sleep    5  
    Wait Until Element Is Visible        ${buttonMaterialEcokraftWhiteOnDesignPage}
    Scroll Element Into View             ${buttonMaterialEcokraftWhiteOnDesignPage}
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}    
    Click Element                        ${buttonMaterialEcokraftWhiteOnDesignPage}
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}    

user choose premium white as material
    Sleep    5  
    Wait Until Element Is Visible        ${buttonMaterialPremiumWhiteOnDesignPage}
    Scroll Element Into View             ${buttonMaterialPremiumWhiteOnDesignPage}
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}    
    Click Element                        ${buttonMaterialPremiumWhiteOnDesignPage}
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}    

user choose material kardus
    [Arguments]    ${MaterialTypeKardus}
    Sleep    10
    Wait Until Element Is Visible    ${buttonMaterialOnDesignPage}
    Set Global Variable              ${MaterialTypeKardus}                            ${MaterialTypeKardus}
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}    
    Click Element                    ${buttonMaterialOnDesignPage}
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}    
    Wait Until Element Is Visible    ${buttonMaterialEcokraftBrownOnDesignPage}
    Run Keyword If                   '${MaterialTypeKardus}' == 'EcoKraft - Brown'    user choose ekocraft brown as material
    ...  ELSE IF                     '${MaterialTypeKardus}' == 'EcoKraft - White'    user choose ekocraft white as material
    ...  ELSE                        user choose premium white as material
    user choose color for full print product
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}    

user choose bahan kardus
    [Arguments]    ${MaterialTypeKardus}    ${MaterialNameKardus}
    Sleep    5    
    Set Local Variable                   ${textMaterialOptionOnDesignPage}        xpath=//h2[text()='${MaterialTypeKardus}']//parent::div/following-sibling::div//div/p[contains(text(),'${MaterialNameKardus}')]
    Wait Until Element Is Visible        ${textMaterialOptionOnDesignPage}
    Set Global Variable                  ${MaterialNameKardus}                    ${MaterialNameKardus}
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}    
    Click Element                        ${textMaterialOptionOnDesignPage}
    # Sleep    5
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}    

user insert uploaded image for design
    Sleep    5  
    Wait Until Element Is Visible        ${buttonMenuImagesOnDesignPage}
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}    
    Click Element                        ${buttonMenuImagesOnDesignPage}
    Wait Until Element Is Visible        ${buttonTabMenuUploadImageOnDesignPage}
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}    
    Click Element                        ${buttonTabMenuUploadImageOnDesignPage}
    Wait Until Element Is Visible        ${imageDataUplodOnDesignPage}
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}    
    Double Click Element                 ${imageDataUplodOnDesignPage}
    # Sleep    15
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}    

user insert stock image for design
    Sleep    5  
    Wait Until Element Is Visible        ${buttonMenuImagesOnDesignPage}
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}    
    Click Element                        ${buttonMenuImagesOnDesignPage}
    Wait Until Element Is Visible        ${buttonTabMenuStockImageOnDesignPage}
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}    
    Click Element                        ${buttonTabMenuStockImageOnDesignPage}
    # Sleep    5
    Wait Until Element Is Visible        ${imageDataStockOnDesignPage}
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}    
    Double Click Element                 ${imageDataStockOnDesignPage}
    # Sleep    10
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}    

user choose kecepatan produksi kardus
    [Arguments]    ${KecepatanProduksi}
    Sleep    5
    Wait Until Element Is Visible        ${textKecepatanProduksiOptionOnDesignPage}
    Set Global Variable                  ${KecepatanProduksi}                              ${KecepatanProduksi}
    Set Local Variable                   ${textKecepatanProduksiOptionOnDesignPage}        xpath=//p[text()='Kecepatan Produksi']/following-sibling::div//span[text()='${KecepatanProduksi}']
    Scroll Element Into View             ${textKecepatanProduksiOptionOnDesignPage}
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}    
    Click Element                        ${textKecepatanProduksiOptionOnDesignPage}
    # Sleep    5
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}    

get random qty kardus
    ${random}                Evaluate        random.randint(50, 150)    modules=random
    Set Global Variable      ${QtyKardus}    ${random}

user input qty kardus
    [Arguments]    ${QtyKardus}
    Sleep    5  
    Wait Until Element Is Visible        ${inputQtyOnDesignPage}
    Run Keyword If                       '${QtyKardus}' == 'random'    get random qty kardus
    ...    ELSE                          Set Global Variable           ${QtyKardus}               ${QtyKardus}
    Clear Element Text                   ${inputQtyOnDesignPage}
    Input Text                           ${inputQtyOnDesignPage}    ${QtyKardus}
    # Sleep    10
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}    

user add design product
    [Arguments]    ${ModelKardus}    ${TipeUkuranKardus}    ${PanjangKardus}    ${LebarKardus}    ${TinggiKardus}    ${MaterialTypeKardus}    ${KecepatanProduksi}    ${QtyKardus}
    user choose model kardus    ${ModelKardus}
    user choose tipe ukuran kardus    ${TipeUkuranKardus}
    user input ukuran custom kardus    ${PanjangKardus}    ${LebarKardus}    ${TinggiKardus}
    user choose material kardus    ${MaterialTypeKardus}
    # user choose bahan kardus    ${MaterialTypeKardus}    ${MaterialNameKardus}
    # user insert uploaded image for design
    # user insert stock image for design
    user choose kecepatan produksi kardus    ${KecepatanProduksi}
    user input qty kardus    ${QtyKardus}
    # user get total amount after design product
    # Sleep    5
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}    

user get total amount after design product
    Wait Until Element Is Visible        ${textTotalOnDesignPage}
    ${totalproductamount}                Get Text                        ${textTotalOnDesignPage}
    ${total_product_amount}              Remove String                   ${totalproductamount}                        Rp 
    ${total_product_amount_edit}=        Evaluate                        '''${total_product_amount}'''.strip()
    Log To Console                       ini total_amount ${total_product_amount_edit}
    Set Global Variable                  ${TotalProductAmount}           ${total_product_amount_edit}

user click button keranjang on design page
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}    
    # Sleep    5
    Click Element                    ${buttonKeranjangOnDesignPage}

user click button pesan sekarang 
    Wait Until Element Is Visible        ${buttonPesanSekarangOnDesignPage}    
    # Sleep    5
    Click Element                    ${buttonPesanSekarangOnDesignPage}

user is on design page with material brown selected
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}    
    ${current_url}=    Get Location
    Log                Current URL: ${current_url}
    Should Contain     ${current_url}                    brown

user is on design page with material fullcolor selected
    # Sleep    5
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}    
    ${current_url}=    Get Location
    Log                Current URL: ${current_url}
    Should Contain     ${current_url}                    premium

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

user is on design page based on model
    [Arguments]    ${modelBox}
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}    
    ${current_url}=    Get Location
    Log                Current URL: ${current_url}
    Run Keyword If     '${modelBox}' == 'mailer'      Should Contain     ${current_url}    mailer
    ...  ELSE IF       '${modelBox}' == 'shipping'    Should Contain     ${current_url}    thedoos 
    ...  ELSE IF       '${modelBox}' == 'goodie'      Should Contain     ${current_url}    goodie
    ...  ELSE          Should Contain     ${current_url}    posh

user click button info finishing on design page
    Wait Until Element Is Visible        ${buttonInfoFinishingOnDesignPage}
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}    
    Click Element                        ${buttonInfoFinishingOnDesignPage}

user get information about finishing premium white on deesign page 
    Wait Until Element Is Visible        ${textPopupFinishingInformationOnDesignPage}
    Element Should Be Visible            ${textPopupFinishingInformationOnDesignPage}

user click icon box color option on design page
    Sleep    5       
    Wait Until Element Is Visible        ${iconBoxColorOptionOnDesignPage}
    Click Element                        ${iconBoxColorOptionOnDesignPage}
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}   

user input color value glossy on design page
    user click icon box color option on design page
    Wait Until Element Is Visible        ${inputHexColorValueOnDesignPage}
    Clear Element Text                   ${inputHexColorValueOnDesignPage}
    Set Local Variable                   ${hex_chars}                        0123456789ABCDEF
    ${color}=                            Evaluate                            ''.join(random.choice('${hex_chars}') for _ in range(6))    modules=random
    Log To Console    ini warna : ${color}
    Input Text                           ${inputHexColorValueOnDesignPage}   ${color}
    Sleep    10
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}      
    Click Element                        ${iconChoosenBoxColorOnDesignPage}
    Wait Until Element Is Visible        ${radioGlossyOnDesignPage}
    Click Element                        ${radioGlossyOnDesignPage}
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}    
   
user input color value doff on design page
    user click icon box color option on design page
    Wait Until Element Is Visible        ${inputHexColorValueOnDesignPage}
    Clear Element Text                   ${inputHexColorValueOnDesignPage}
    Set Local Variable                   ${hex_chars}    0123456789ABCDEF
    ${color}=                            Evaluate        ''.join(random.choice('${hex_chars}') for _ in range(6))    modules=random
    Log To Console    ini warna : ${color}
    Input Text                           ${inputHexColorValueOnDesignPage}    ${color}
    Sleep    10
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}       
    Click Element                        ${iconChoosenBoxColorOnDesignPage}
    Wait Until Element Is Visible        ${radioDoffOnDesignPage}
    Click Element                        ${radioDoffOnDesignPage}
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}   

user choose color for full print product
    Sleep    5       
    Run Keyword If                   '${MaterialTypeKardus}' == 'Premium - Glossy'    user input color value glossy on design page
    ...  ELSE IF                     '${MaterialTypeKardus}' == 'Premium - Doff'    user input color value doff on design page
    ...  ELSE                        Log To Console    product bukan fullprint
    Wait Until Element Is Visible        ${buttonKeranjangOnDesignPage}    
    
user choose flute for shipping box
    [Arguments]    ${FluteShipping}
    Wait Until Element Is Visible    ${radioSingleWallOnDesignPage}
    Sleep    5
    Set Global Variable              ${FluteShipping}                       ${FluteShipping}
    Run Keyword If                   '${FluteShipping}' == 'Single Wall'    Click Element    ${radioSingleWallOnDesignPage}
    ...  ELSE                        Click Element                          ${radioDoubleWallOnDesignPage}
    Wait Until Element Is Visible    ${buttonKeranjangOnDesignPage}