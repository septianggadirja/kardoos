*** Settings ***

Resource    ../PageObject/HomePage.robot
Resource    ../PageObject/DesignPage.robot
Resource    ../PageObject/KatalogPage.robot
Resource    ../PageObject/TentangKardoosPage.robot
Resource    ../PageObject/FAQsPage.robot
Resource    ../PageObject/MaterialPage.robot
Resource    ../PageObject/InspirasiPage.robot
Resource    ../PageObject/BlogListPage.robot
Resource    ../PageObject/DashboardPage.robot
Resource    ../PageObject/KardoosInstantPage.robot
Resource    ../PageObject/InstantTemplatePage.robot
Resource    ../PageObject/MarketPlacePage.robot
Resource    ../PageObject/CariSupplierPage.robot
Resource    ../PageObject/SyaratKetentutanPage.robot
Resource    ../PageObject/KebijakanPrivasiPage.robot

*** Keywords ***
Access design page from header
    Given user is on home page
    When user go to design page from menu instant
    Then user is on design page

Access katalog page from header
    Given user is on home page
    When user go to marketplace page
    Then user is on katalog page

Access tentang kardoos page from header
    Given user is on home page
    When user go to tentang kardoos page from menu tentang kardoos
    Then user is on tentang kardoos page

Access instant template page from header based on model
    [Arguments]    ${modelBox}
    Given user is on home page
    When user choose model box from header    ${modelBox}
    Then user is on instant template page based on model    ${modelBox}

Access FAQs page from header
    Given user is on home page
    When user go to faqs page from menu faqs
    Then user is on FAQs page
    
Access tentang kardoos page from footer
    Given user is on home page
    When user go to tentang kardoos page from footer
    Then user is on tentang kardoos page

Access material & proses page from footer
    Given user is on home page
    When user go to material & proses page from footer
    Then user is on material page

Access inspirasi page from footer
    Given user is on home page
    When user go to inspirasi page from footer
    Then user is on inspirasi page

Access blog list page from footer
    Given user is on home page
    When user go to blog list page from footer
    Then user is on blog list page

Access kardoos instant page from footer
    Given user is on home page
    When user go to instant page from footer
    Then user is on kardoos instant page

Access design page from footer
    Given user is on home page
    When user go to design page from footer
    Then user is on design page

Access instant template page from footer
    Given user is on home page
    When user go to instant template page from footer
    Then user is on instant template page

Access marketplace page from footer
    Given user is on home page
    When user go to market place page from footer
    Then user is on marketplace page

Access cari supplier page from footer
    Given user is on home page
    When user go to cari supplier page from footer
    Then user is on supplier list katalog page

Access syarat & ketentuan page from footer
    Given user is on home page
    When user go to syarat & ketentuan page from footer
    Then user is on syarat & ketentuan page

Access kebijakan privasi page from footer
    Given user is on home page
    When user go to kebijakan privasi page from footer
    Then user is on kebijakan privasi page

Access faqs page from footer
    Given user is on home page
    When user go to faqs page from footer
    Then user is on FAQs page

Access instant template page from footer based on model
    [Arguments]    ${modelBox}
    Given user is on home page
    When user choose model box from footer    ${modelBox}
    Then user is on instant template page