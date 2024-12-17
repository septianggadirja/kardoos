*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${textMenuCariSupplierFavoritmu}                 xpath=//h1[text()='Cari Supplier Favoritmu']
${inputSearchFavoritSupplier}                    xpath=//input[@class='search-box' and @placeholder='Cari Supplier favoritmu']
${checkboxAllSupplierLocation}                   xpath=//label[text()='Semua']/preceding-sibling::input
${checkboxSupplierLocation}                      xpath=//label[text()='']/preceding-sibling::input
${textSupplierNameOnCariSupplierPage}            xpath=(//button[text()='Lihat Detail']/preceding-sibling::div/div/h2)
${textSupplierAddressOnCariSupplierPage}         xpath=(//button[text()='Lihat Detail']/preceding-sibling::div/div/h3)
${buttonLihatDetaiSupplierlOnCariSupplierPage}   xpath=(//button[text()='Lihat Detail'])

*** Keywords ***
user is on cari supplier page
    Wait Until Element Is Visible        ${textMenuCariSupplierFavoritmu}
    Element Should Be Visible            ${textMenuCariSupplierFavoritmu}

user input supplier name for search on cari supplier page
    Wait Until Element Is Visible        ${textSupplierNameOnCariSupplierPage}
    Sleep    3
    ${totalsupplier}                     Get Element Count                                   ${textSupplierNameOnCariSupplierPage}
    ${random}                            Evaluate    random.randint(1, ${totalsupplier})     modules=random
    ${index}                             Catenate    [${random}]  
    Set Local Variable                   ${textSupplierNameOnCariSupplierPage}               xpath=(//button[text()='Lihat Detail']/preceding-sibling::div/div/h2)${index}
    ${randomsuppliername}                Get Text                                            ${textSupplierNameOnCariSupplierPage}
    Set Global Variable                  ${SupplierName}                                     ${randomsuppliername}
    Clear Element Text                   ${inputSearchFavoritSupplier}
    Input Text                           ${inputSearchFavoritSupplier}                       ${SupplierName}
    Sleep    3

verify supplier list displayed based on search result on cari supplier page
    Wait Until Element Is Visible        ${textSupplierNameOnCariSupplierPage}
    ${totalsupplier}                     Get Element Count                                   ${textSupplierNameOnCariSupplierPage}
    ${random}                            Evaluate    random.randint(1, ${totalsupplier})     modules=random
    ${index}                             Catenate    [${random}]
    Set Local Variable                   ${textSupplierNameOnCariSupplierPage}               xpath=(//button[text()='Lihat Detail']/preceding-sibling::div/div/h2)${index}
    ${randomsuppliername}                Get Text                                            ${textSupplierNameOnCariSupplierPage}
    Element Text Should Be               ${textSupplierNameOnCariSupplierPage}               ${SupplierName}

user click all location on cari supplier page
    Wait Until Element Is Visible        ${checkboxAllSupplierLocation}
    Scroll Element Into View             ${checkboxAllSupplierLocation}
    Click Element                        ${checkboxAllSupplierLocation}

user filter supplier based on location on cari supplier page
    Wait Until Element Is Visible        ${textSupplierNameOnCariSupplierPage}
    ${totalsupplier}                     Get Element Count                                   ${textSupplierNameOnCariSupplierPage}
    ${random}                            Evaluate    random.randint(1, ${totalsupplier})     modules=random
    ${index}                             Catenate    [${random}]  
    Set Local Variable                   ${textSupplierAddressOnCariSupplierPage}            xpath=(//button[text()='Lihat Detail']/preceding-sibling::div/div/h3)${index}
    ${supplieraddress}                   Get Text                                            ${textSupplierAddressOnCariSupplierPage}
    Set Global Variable                  ${SupplierAddress}                                  ${supplieraddress}
    Set Global Variable                  ${SupplierKabupaten}                                ${supplieraddress.split(",")[1].strip()}
    Set Local Variable                   ${textSupplierNameOnCariSupplierPage}               xpath=(//button[text()='Lihat Detail']/preceding-sibling::div/div/h2)${index}
    ${randomsuppliername}                Get Text                                            ${textSupplierNameOnCariSupplierPage}
    Set Global Variable                  ${SupplierName}                                     ${randomsuppliername}
    user click all location on cari supplier page
    Set Local Variable                   ${checkboxSupplierLocation}                         xpath=//label[text()='${SupplierKabupaten}']/preceding-sibling::input
    Scroll Element Into View             ${checkboxSupplierLocation}
    Click Element                        ${checkboxSupplierLocation}

verify supplier list filtered by lokasi on cari supplier page
    Wait Until Element Is Visible        ${textSupplierAddressOnCariSupplierPage}
    ${totalsupplier}                     Get Element Count                                   ${textSupplierAddressOnCariSupplierPage}
    ${random}                            Evaluate    random.randint(1, ${totalsupplier})     modules=random
    ${index}                             Catenate    [${random}]
    Set Local Variable                   ${textSupplierAddressOnCariSupplierPage}            xpath=(//button[text()='Lihat Detail']/preceding-sibling::div/div/h3)${index}
    ${randomsupplieraddress}             Get Text                                            ${textSupplierAddressOnCariSupplierPage}
    Element Should Contain               ${textSupplierAddressOnCariSupplierPage}                  ${SupplierKabupaten}

user go to supplier detail from cari supplier page
    Wait Until Element Is Visible        ${buttonLihatDetaiSupplierlOnCariSupplierPage}
    ${totalsupplier}                     Get Element Count                                   ${buttonLihatDetaiSupplierlOnCariSupplierPage}
    ${random}                            Evaluate    random.randint(1, ${totalsupplier})     modules=random
    ${index}                             Catenate    [${random}]  
    Set Local Variable                   ${textSupplierAddressOnCariSupplierPage}            xpath=(//button[text()='Lihat Detail']/preceding-sibling::div/div/h3)${index}
    ${supplieraddress}                   Get Text                                            ${textSupplierAddressOnCariSupplierPage}
    Set Global Variable                  ${SupplierAddress}                                  ${supplieraddress}
    Set Global Variable                  ${SupplierKabupaten}                                ${supplieraddress.split(",")[1].strip()}
    Set Local Variable                   ${textSupplierNameOnCariSupplierPage}               xpath=(//button[text()='Lihat Detail']/preceding-sibling::div/div/h2)${index}
    ${randomsuppliername}                Get Text                                            ${textSupplierNameOnCariSupplierPage}
    Set Global Variable                  ${SupplierName}                                     ${randomsuppliername}
    Set Local Variable                   ${buttonLihatDetaiSupplierlOnCariSupplierPage}      xpath=(//button[text()='Lihat Detail'])${index}
    Scroll Element Into View             ${buttonLihatDetaiSupplierlOnCariSupplierPage}
    Sleep    3
    Click Element                        ${buttonLihatDetaiSupplierlOnCariSupplierPage}
