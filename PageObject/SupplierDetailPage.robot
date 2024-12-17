*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${textSupplierNameOnSupplierDetail}        xpath=//h1[@class='dts-nama-pt']
${textSupplierAddressOnSupplierDetail}     xpath=//div[@class='dts-alamat-pt']

*** Keywords ***
user is on supplier detail page
    Wait Until Element Is Visible        ${textSupplierNameOnSupplierDetail}
    Element Should Be Visible            ${textSupplierNameOnSupplierDetail}
    Element Should Be Visible            ${textSupplierAddressOnSupplierDetail}

verify data on supplier detail page
    Wait Until Element Is Visible        ${textSupplierNameOnSupplierDetail}
    Element Should Contain               ${textSupplierNameOnSupplierDetail}       ${SupplierName} 
    Element Should Contain               ${textSupplierAddressOnSupplierDetail}    ${SupplierKabupaten}