*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${buttonLogin}                    xpath=//button[@class='login']
${buttonRegister}                 xpath=//button[@class='register']
${textMenuInstant}                xpath=//ul[@class='header-menu-list']/li[text()='Instant']
${textMenuMarketplace}            xpath=//ul[@class='header-menu-list']/li[text()='Marketplace']
${textMenuTentangKardoos}         xpath=//ul[@class='header-menu-list']/li[text()='Tentang KARDOOS']
${textMenuFAQs}                   xpath=//ul[@class='header-menu-list']/li[text()='FAQs']
${iconProfile}                    xpath=//img[contains(@src,'/images/profile.svg')]
${iconCart}                       xpath=//div/img[contains(@src,'keranjang')]
${buttonLogout}                   xpath=//div[@class='tab-login-menu']/div[6]
${buttonConfirmLogout}            xpath=//div[text()='Keluar Akun']/following-sibling::div/button[text()='Iya']
${textFooterTentangKardoos}       xpath=//ul[@class='group-menu-footers']/li[text()='Tentang KARDOOS']
${textFooterMaterialProses}       xpath=//ul[@class='group-menu-footers']/li[text()='Material & Proses']
${textFooterInspirasi}            xpath=//ul[@class='group-menu-footers']/li[text()='Inspirasi']
${textFooterBlog}                 xpath=//ul[@class='group-menu-footers']/li[text()='Blog']
${textFooterInstant}              xpath=//ul[@class='group-menu-footers']/li[text()='Instant']
${textFooterInstantEditor}        xpath=//ul[@class='group-menu-footers']/li[text()='Instant Editor']
${textFooterInstantTemplate}      xpath=//ul[@class='group-menu-footers']/li[text()='Instant Template']
${textFooterMarketPlace}          xpath=//ul[@class='group-menu-footers']/li[text()='Marketplace']
${textFooterCariSupplier}         xpath=//ul[@class='group-menu-footers']/li[text()='Cari Supplier']
${textFooterSyaratKetentuan}      xpath=//ul[@class='group-menu-footers']/li[text()='Syarat dan Ketentuan']
${textFooterKebijakanPrivasi}     xpath=//ul[@class='group-menu-footers']/li[text()='Kebijakan Privasi']
${textFooterFAQs}                 xpath=//ul[@class='group-menu-footers']/li[text()='FAQs']

*** Keywords ***
user is on home page
    Wait Until Element Is Visible    ${textMenuInstant}
    Element Should Be Visible        ${textMenuInstant}

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
    Wait Until Element Is Visible        ${textMenuInstant}
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

user go to instant template page from footer
    Wait Until Element Is Visible        ${textFooterInstantTemplate}
    Scroll Element Into View             ${textFooterInstantTemplate}
    Click Element                        ${textFooterInstantTemplate}

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