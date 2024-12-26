*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${buttonProductsOnKatalogPage}              xpath=//div[text()='Products']
${buttonSuppliersOnKatalogPage}             xpath=//div[text()='Suppliers']
${inputSearchOnKatalogPage}                 xpath=//input[@id='searchbar']
${textFilterJenisPackagingOnKatalogPage}    xpath=//p[text()='Jenis Packaging']/following-sibling::div//li[text()='Semua']
${textJenisPackagingOnKatalogPage}          xpath=(//div[text()='Products']//ancestor::div/following-sibling::div//p[1])
${textNamaPackagingOnKatalogPage}           xpath=(//div[text()='Products']//ancestor::div/following-sibling::div//p[2])
${textFilterLokasiOnKatalogPage}            xpath=//p[text()='Lokasi']/following-sibling::div//li//span[text()='']
${textSupplierNameOnKatalogPage}            xpath=(//div[text()='Suppliers']//ancestor::div/following-sibling::div//h2)
${textSupplierAddressOnKatalogPage}         xpath=(//div[text()='Suppliers']//ancestor::div/following-sibling::div//h2/following-sibling::p)
${buttonLihatDetaiSupplierlOnKatalogPage}   xpath=(//button[text()='Lihat Detail'])

*** Keywords ***
user is on katalog page
    Wait Until Element Is Visible    ${buttonProductsOnKatalogPage}
    Element Should Be Visible        ${buttonProductsOnKatalogPage}

user get product list on katalog page
    Wait Until Element Is Visible        ${buttonProductsOnKatalogPage}
    Click Element                        ${buttonProductsOnKatalogPage}

user go to product detail from katalog page
    Wait Until Element Is Visible        ${textJenisPackagingOnKatalogPage}
    ${totalproduct}                      Get Element Count                                   ${textJenisPackagingOnKatalogPage}
    ${random}                            Evaluate    random.randint(1, 2)      modules=random
    ${index}                             Catenate    [${random}]  
    Set Local Variable                   ${textJenisPackagingOnKatalogPage}                  xpath=(//div[text()='Products']//ancestor::div/following-sibling::div//p[1])${index}
    ${randompackaging}                   Get Text                                            ${textJenisPackagingOnKatalogPage}
    Set Global Variable                  ${JenisPackaging}                                   ${randompackaging}
    Set Local Variable                   ${textNamaPackagingOnKatalogPage}                   xpath=(//div[text()='Products']//ancestor::div/following-sibling::div//p[2])${index}
    ${randompackaging}                   Get Text                                            ${textNamaPackagingOnKatalogPage}
    Set Global Variable                  ${NamaPackaging}                                    ${randompackaging}
    Scroll Element Into View             ${textNamaPackagingOnKatalogPage}
    Click Element                        ${textNamaPackagingOnKatalogPage}

user filter product based on jenis packaging on katalog page
    Wait Until Element Is Visible        ${textJenisPackagingOnKatalogPage}
    ${totalproduct}                      Get Element Count                                   ${textJenisPackagingOnKatalogPage}
    ${random}                            Evaluate    random.randint(1, ${totalproduct})      modules=random
    ${index}                             Catenate    [${random}]  
    Set Local Variable                   ${textJenisPackagingOnKatalogPage}                  xpath=(//div[text()='Products']//ancestor::div/following-sibling::div//p[1])${index}
    ${randompackaging}                   Get Text                                            ${textJenisPackagingOnKatalogPage}
    Set Global Variable                  ${JenisPackaging}                                   ${randompackaging}
    Set Local Variable                   ${textFilterJenisPackagingOnKatalogPage}            xpath=//p[text()='Jenis Packaging']/following-sibling::div//li[text()='${JenisPackaging}']
    Wait Until Element Is Visible        ${textFilterJenisPackagingOnKatalogPage}
    Click Element                        ${textFilterJenisPackagingOnKatalogPage}

verify product list filtered by jenis packaging on katalog page
    Wait Until Element Is Visible        ${textJenisPackagingOnKatalogPage}
    ${totalproduct}                      Get Element Count                                   ${textJenisPackagingOnKatalogPage}
    ${random}                            Evaluate    random.randint(1, ${totalproduct})      modules=random
    ${index}                             Catenate    [${random}]
    Set Local Variable                   ${textJenisPackagingOnKatalogPage}                  xpath=(//div[text()='Products']//ancestor::div/following-sibling::div//p[1])${index}
    ${randompackaging}                   Get Text                                            ${textJenisPackagingOnKatalogPage}
    Element Text Should Be               ${textJenisPackagingOnKatalogPage}                  ${JenisPackaging}

user search product on katalog page
    Wait Until Element Is Visible        ${textNamaPackagingOnKatalogPage}
    ${totalproduct}                      Get Element Count                                   ${textNamaPackagingOnKatalogPage}
    ${random}                            Evaluate    random.randint(1, ${totalproduct})      modules=random
    ${index}                             Catenate    [${random}]  
    Set Local Variable                   ${textNamaPackagingOnKatalogPage}                   xpath=(//div[text()='Products']//ancestor::div/following-sibling::div//p[2])${index}
    ${randompackaging}                   Get Text                                            ${textNamaPackagingOnKatalogPage}
    Set Global Variable                  ${NamaPackaging}                                    ${randompackaging}
    Input Text                           ${inputSearchOnKatalogPage}                         ${NamaPackaging}
    Press Keys                           ${inputSearchOnKatalogPage}                         RETURN

verify product list displayed based on search result on katalog page
    Wait Until Element Is Visible        ${textNamaPackagingOnKatalogPage}
    ${totalproduct}                      Get Element Count                                   ${textNamaPackagingOnKatalogPage}
    ${random}                            Evaluate    random.randint(1, ${totalproduct})      modules=random
    ${index}                             Catenate    [${random}]
    Set Local Variable                   ${textNamaPackagingOnKatalogPage}                   xpath=(//div[text()='Products']//ancestor::div/following-sibling::div//p[2])${index}
    ${randompackaging}                   Get Text                                            ${textNamaPackagingOnKatalogPage}
    Element Should Contain               ${textNamaPackagingOnKatalogPage}                   ${NamaPackaging}
    # Element Text Should Be               ${textNamaPackagingOnKatalogPage}                   ${NamaPackaging}

user get supplier list on katalog page
    Wait Until Element Is Visible        ${buttonSuppliersOnKatalogPage}
    Click Element                        ${buttonSuppliersOnKatalogPage}

user is on supplier list katalog page
    Wait Until Element Is Visible        ${buttonSuppliersOnKatalogPage}
    ${current_url}=    Get Location
    Log                Current URL: ${current_url}
    Should Contain     ${current_url}                    /katalog?option
    
user go to supplier detail from katalog page
    Wait Until Element Is Visible        ${textSupplierAddressOnKatalogPage}
    ${totalsupplier}                     Get Element Count                                   ${textSupplierAddressOnKatalogPage}
    ${random}                            Evaluate    random.randint(1, 2)     modules=random
    ${index}                             Catenate    [${random}]  
    Set Local Variable                   ${textSupplierAddressOnKatalogPage}                 xpath=(//div[text()='Suppliers']//ancestor::div/following-sibling::div//h2/following-sibling::p)${index}
    ${supplieraddress}                   Get Text                                            ${textSupplierAddressOnKatalogPage}
    Set Global Variable                  ${SupplierAddress}                                  ${supplieraddress}
    Set Global Variable                  ${SupplierKabupaten}                                ${supplieraddress.split(",")[1].strip()}
    Set Local Variable                   ${textSupplierNameOnKatalogPage}                    xpath=(//div[text()='Suppliers']//ancestor::div/following-sibling::div//h2)${index}
    ${randomsuppliername}                Get Text                                            ${textSupplierNameOnKatalogPage}
    Set Global Variable                  ${SupplierName}                                     ${randomsuppliername}
    Set Local Variable                   ${buttonLihatDetaiSupplierlOnKatalogPage}           xpath=(//button[text()='Lihat Detail'])${index}
    Scroll Element Into View             ${buttonLihatDetaiSupplierlOnKatalogPage}
    Sleep    3
    Click Element                        ${buttonLihatDetaiSupplierlOnKatalogPage}

user filter supplier based on location on katalog page
    Wait Until Element Is Visible        ${textSupplierAddressOnKatalogPage}
    ${totalsupplier}                     Get Element Count                                   ${textSupplierAddressOnKatalogPage}
    ${random}                            Evaluate    random.randint(1, ${totalsupplier})     modules=random
    ${index}                             Catenate    [${random}]  
    Set Local Variable                   ${textSupplierAddressOnKatalogPage}                 xpath=(//div[text()='Suppliers']//ancestor::div/following-sibling::div//h2/following-sibling::p)${index}
    ${supplieraddress}                   Get Text                                            ${textSupplierAddressOnKatalogPage}
    Set Global Variable                  ${SupplierKabupaten}                                ${supplieraddress.split(",")[1].strip()}
    Set Local Variable                   ${textFilterLokasiOnKatalogPage}                    xpath=//p[text()='Lokasi']/following-sibling::div//li//span[text()='${SupplierKabupaten}']
    Wait Until Element Is Visible        ${textFilterLokasiOnKatalogPage}
    Scroll Element Into View             ${textFilterLokasiOnKatalogPage}
    Click Element                        ${textFilterLokasiOnKatalogPage}

verify supplier list filtered by lokasi on katalog page
    Wait Until Element Is Visible        ${textSupplierAddressOnKatalogPage}
    ${totalsupplier}                     Get Element Count                                   ${textSupplierAddressOnKatalogPage}
    ${random}                            Evaluate    random.randint(1, ${totalsupplier})     modules=random
    ${index}                             Catenate    [${random}]
    Set Local Variable                   ${textSupplierAddressOnKatalogPage}                 xpath=(//div[text()='Suppliers']//ancestor::div/following-sibling::div//h2/following-sibling::p)${index}
    ${randomsupplieraddress}             Get Text                                            ${textSupplierAddressOnKatalogPage}
    Element Should Contain               ${textSupplierAddressOnKatalogPage}                 ${SupplierKabupaten}

user search supplier on katalog page
    Wait Until Element Is Visible        ${textSupplierNameOnKatalogPage}
    ${totalsupplier}                     Get Element Count                                   ${textSupplierNameOnKatalogPage}
    ${random}                            Evaluate    random.randint(1, ${totalsupplier})     modules=random
    ${index}                             Catenate    [${random}]  
    Set Local Variable                   ${textSupplierNameOnKatalogPage}                    xpath=(//div[text()='Suppliers']//ancestor::div/following-sibling::div//h2)${index}
    ${randomsuppliername}                Get Text                                            ${textSupplierNameOnKatalogPage}
    Set Global Variable                  ${SupplierName}                                     ${randomsuppliername}
    Input Text                           ${inputSearchOnKatalogPage}                         ${SupplierName}
    Press Keys                           ${inputSearchOnKatalogPage}                         RETURN

verify supplier list displayed based on search result on katalog page
    Wait Until Element Is Visible        ${textSupplierNameOnKatalogPage}
    ${totalsupplier}                     Get Element Count                                   ${textSupplierNameOnKatalogPage}
    ${random}                            Evaluate    random.randint(1, ${totalsupplier})     modules=random
    ${index}                             Catenate    [${random}]
    Set Local Variable                   ${textSupplierNameOnKatalogPage}                    xpath=(//div[text()='Suppliers']//ancestor::div/following-sibling::div//h2)${index}
    ${randomsuppliername}                Get Text                                            ${textSupplierNameOnKatalogPage}
    Element Should Contain               ${textSupplierNameOnKatalogPage}                    ${SupplierName}
    # Element Text Should Be               ${textSupplierNameOnKatalogPage}                    ${SupplierName}
