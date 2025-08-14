*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${buttonLogin}                    xpath=//button[text()='Log in']
${buttonRegister}                 xpath=//button[text()='Register']
${textMenuInstant}                xpath=//a[@href='/design']
${textMenuMarketplace}            xpath=//a[@href='/katalog']
${textMenuTentangKardoos}         xpath=//a[@href='/tentang-kardoos?layout=true']
${dropdownModelBox}               xpath=//span[text()='Model Box']/parent::button
${textSubMenuMailerBox}           xpath=//span[text()='Model Box']/parent::button/following-sibling::div//button[text()='Mailer Box']
${textSubMenuShippingBox}         xpath=//span[text()='Model Box']/parent::button/following-sibling::div//button[text()='Shipping Box']
${textSubMenuGoodieBox}           xpath=//span[text()='Model Box']/parent::button/following-sibling::div//button[text()='Goodie Box']
${textSubMenuPoshBox}             xpath=//span[text()='Model Box']/parent::button/following-sibling::div//button[text()='Posh Box']
${textMenuFAQs}                   xpath=//a[@href='/faq']
${iconProfile}                    xpath=//a[@href='/dashboard']
${iconCart}                       xpath=//a[@href='/cart']//*[name()='svg']
${buttonLogout}                   xpath=//a[@href='/dashboard']//ancestor::div/following-sibling::*[name()='svg']
${buttonConfirmLogout}            xpath=//button[@id='btn-ok']
${textFooterTentangKardoos}       xpath=//li/a[text()='Tentang KARDOOS']
${textFooterMaterialProses}       xpath=//li/a[text()='Material & Proses']
${textFooterInspirasi}            xpath=//li/a[text()='Inspirasi']
${textFooterBlog}                 xpath=//li/a[text()='Blog']
${textFooterInstant}              xpath=//li/a[text()='Instant']
${textFooterInstantEditor}        xpath=//li/a[text()='Instant Editor']
# ${textFooterInstantTemplate}      xpath=//li/a[text()='Instant Template']
${textFooterModelBox}             xpath=//li/a/div[text()='Model Box']
${textFooterMarketPlace}          xpath=//li/a[text()='Marketplace']
${textFooterCariSupplier}         xpath=//li/a[text()='Cari Supplier']
${textFooterSyaratKetentuan}      xpath=//li/a[text()='Syarat dan Ketentuan']
${textFooterKebijakanPrivasi}     xpath=//li/a[text()='Kebijakan Privasi']
${textFooterFAQs}                 xpath=//li/a[text()='FAQs']
${textFooterMailerBox}            xpath=//div//a[text()='Mailer Box']
${textFooterShippingBox}          xpath=//div//a[text()='Shipping Box']
${textFooterGoodieBox}            xpath=//div//a[text()='Goodie Box']
${textFooterPoshBox}              xpath=//div//a[text()='Posh Box']

*** Keywords ***
user is on home page
    ${isMenuInstantDisplayed}            Run Keyword And Return Status            Wait Until Element Is Visible    ${textMenuInstant}
    Run Keyword If                       '${isMenuInstantDisplayed}' == 'False'   Go To                            ${KARDOOS_URL}       
    ...  ELSE                            Log To Console                           instant menu displayed    
    Wait Until Element Is Visible        ${textMenuInstant}
    Element Should Be Visible            ${textMenuInstant}

user go to login page
    Wait Until Element Is Visible    ${buttonLogin}
    Click Element                    ${buttonLogin}

user go to register page
    Wait Until Element Is Visible    ${buttonRegister}
    Click Element                    ${buttonRegister}

user success to login
    Wait Until Element Is Visible    ${iconProfile}
    Element Should Be Visible        ${iconProfile}

user click button logout
    Wait Until Element Is Visible    ${buttonLogout}
    Scroll Element Into View         ${buttonLogout}
    Click Element                    ${buttonLogout}

user confirm to logout
    Wait Until Element Is Visible    ${buttonConfirmLogout}
    Click Element                    ${buttonConfirmLogout}

user success to logout
    Wait Until Element Is Not Visible    ${iconProfile}
    Element Should Not Be Visible        ${iconProfile}

user reload page
    Go To                           ${KARDOOS_URL}
    Reload Page

user go to cart page
    Sleep    3
    Wait Until Element Is Visible    ${iconCart}
    Click Element                    ${iconCart}

user go to marketplace page
    Wait Until Element Is Visible    ${textMenuMarketplace}
    Click Element                    ${textMenuMarketplace}

user go to dashboard page
    Wait Until Element Is Visible    ${iconProfile}
    Click Element                    ${iconProfile}

user go to design page from menu instant 
    ${isMenuInstantDisplayed}            Run Keyword And Return Status            Wait Until Element Is Visible    ${textMenuInstant}
    Run Keyword If                       '${isMenuInstantDisplayed}' == 'False'   Go To                            ${KARDOOS_URL}       
    ...  ELSE                            Log To Console                           instant menu displayed      
    Click Element                        ${textMenuInstant}

user go to tentang kardoos page from menu tentang kardoos
    Wait Until Element Is Visible    ${textMenuTentangKardoos}
    Click Element                    ${textMenuTentangKardoos}

user go to faqs page from menu faqs
    Wait Until Element Is Visible        ${textMenuFAQs}
    Click Element                        ${textMenuFAQs}

user go to tentang kardoos page from footer
    Wait Until Element Is Visible        ${textFooterTentangKardoos}
    Scroll Element Into View             ${textFooterTentangKardoos}
    Click Element                        ${textFooterTentangKardoos}

user go to material & proses page from footer
    Wait Until Element Is Visible        ${textFooterMaterialProses}
    Scroll Element Into View             ${textFooterMaterialProses}
    Click Element                        ${textFooterMaterialProses}

user go to inspirasi page from footer
    Wait Until Element Is Visible        ${textFooterInspirasi}
    Scroll Element Into View             ${textFooterInspirasi}
    Click Element                        ${textFooterInspirasi}

user go to blog list page from footer
    Wait Until Element Is Visible        ${textFooterBlog}
    Scroll Element Into View             ${textFooterBlog}
    Click Element                        ${textFooterBlog}

user go to instant page from footer
    Wait Until Element Is Visible        ${textFooterInstant}
    Scroll Element Into View             ${textFooterInstant}
    Click Element                        ${textFooterInstant}

user go to design page from footer
    Wait Until Element Is Visible        ${textFooterInstantEditor}
    Scroll Element Into View             ${textFooterInstantEditor}
    Click Element                        ${textFooterInstantEditor}

# user go to instant template page from footer
#     Wait Until Element Is Visible        ${textFooterInstantTemplate}
#     Scroll Element Into View             ${textFooterInstantTemplate}
#     Click Element                        ${textFooterInstantTemplate}

user go to instant template page from footer
    Wait Until Element Is Visible        ${textFooterModelBox}
    Scroll Element Into View             ${textFooterModelBox}
    Click Element                        ${textFooterModelBox}

user go to market place page from footer
    Wait Until Element Is Visible        ${textFooterMarketPlace}
    Scroll Element Into View             ${textFooterMarketPlace}
    Click Element                        ${textFooterMarketPlace}

user go to cari supplier page from footer
    Wait Until Element Is Visible        ${textFooterCariSupplier}
    Scroll Element Into View             ${textFooterCariSupplier}
    Click Element                        ${textFooterCariSupplier}

user go to syarat & ketentuan page from footer
    Wait Until Element Is Visible        ${textFooterSyaratKetentuan}
    Scroll Element Into View             ${textFooterSyaratKetentuan}
    Click Element                        ${textFooterSyaratKetentuan}

user go to kebijakan privasi page from footer
    Wait Until Element Is Visible        ${textFooterKebijakanPrivasi}
    Scroll Element Into View             ${textFooterKebijakanPrivasi}
    Click Element                        ${textFooterKebijakanPrivasi}

user go to faqs page from footer
    Wait Until Element Is Visible        ${textFooterFAQs}
    Scroll Element Into View             ${textFooterFAQs}
    Click Element                        ${textFooterFAQs}

user click mailer box from footer
    Scroll Element Into View         ${textFooterMailerBox}
    Click Element                    ${textFooterMailerBox}      

user click shipping box from footer
    Scroll Element Into View         ${textFooterShippingBox}
    Click Element                    ${textFooterShippingBox}    

user click goodie box from footer
    Scroll Element Into View         ${textFooterGoodieBox}
    Click Element                    ${textFooterGoodieBox}      

user click posh box from footer
    Scroll Element Into View         ${textFooterPoshBox}
    Click Element                    ${textFooterPoshBox}  

user choose model box from footer
    [Arguments]    ${modelBox}
    Wait Until Element Is Visible    ${textFooterModelBox}
    Scroll Element Into View         ${textFooterModelBox}
    ${isModelBoxOpen}                Run Keyword And Return Status    Wait Until Element Is Visible    ${textFooterMailerBox}    timeout=5
    Run Keyword If                  '${isModelBoxOpen}' == 'True'     Log To Console    model box footer sudah terbuka
    ...  ELSE                        Click Element                    ${textFooterModelBox}
    Wait Until Element Is Visible    ${textFooterPoshBox}
    Run Keyword If                  '${modelBox}' == 'mailer'         user click mailer box from footer 
    ...  ELSE IF                    '${modelBox}' == 'shipping'       user click shipping box from footer
    ...  ELSE IF                    '${modelBox}' == 'goodie'         user click goodie box from footer
    ...  ELSE                       user click posh box from footer

user open dropdown menu model box
    ${isMenuModelBoxOpen}                Run Keyword And Return Status            Wait Until Element Is Visible    ${textSubMenuMailerBox}    timeput=10
    Run Keyword If                       '${isMenuModelBoxOpen}' == 'False'       Click Element                    ${dropdownModelBox}  
    ...  ELSE                            Log To Console                           menu model box open  

user choose model box from header
    [Arguments]    ${modelBox}
    user open dropdown menu model box
    Run Keyword If    '${modelBox}' == 'Mailer Box'      Click Element    ${textSubMenuMailerBox}
    ...  ELSE IF      '${modelBox}' == 'Shipping Box'    Click Element    ${textSubMenuShippingBox}
    ...  ELSE IF      '${modelBox}' == 'Goodie Box'      Click Element    ${textSubMenuGoodieBox}
    ...  ELSE         Click Element                      ${textSubMenuPoshBox}