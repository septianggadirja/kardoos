*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${textNama-JenisOnProductDetailPage}        xpath=//img[@alt='card image']/following-sibling::div//p

*** Keywords ***
user is on product detail page
    Wait Until Element Is Visible        ${textNama-JenisOnProductDetailPage}
    Element Should Be Visible            ${textNama-JenisOnProductDetailPage}

verify data on product detail page
    Wait Until Element Is Visible        ${textNama-JenisOnProductDetailPage}
    # Element Should Contain               ${textNama-JenisOnProductDetailPage}    ${NamaPackaging}
    Element Should Contain               ${textNama-JenisOnProductDetailPage}    ${JenisPackaging}