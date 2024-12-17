*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${checkboxPilihSemuaOnCartPage}        xpath=//label[text()='Pilih Semua ']/preceding-sibling::input
${textModelOnCartPage}                 xpath=//div[text()='Model']/following-sibling::label
${textUkuranOnCartPage}                xpath=//div[text()='Ukuran']/following-sibling::label
${textMaterialOnCartPage}              xpath=//div[text()='Material']/following-sibling::label
${inputQtyOnCartPage}                  xpath=//div[text()='Jumlah']/following-sibling::div/input
${iconDeleteOnCartPage}                xpath=(//img[contains(@src,'delete')])
${buttonHapusOnCartPage}               xpath=//button[text()='Hapus']
${buttonBelanjaSekarang}               xpath=//div[text()='Belanja Sekarang']
${buttonCheckoutOnCartPage}            xpath=//button[text()='Checkout']

*** Keywords ***
user is on cart page
    Sleep    5
    ${current_url}=    Get Location
    Log    Current URL: ${current_url}
    Should Contain    ${current_url}    /cart

user cleaning cart page
    Sleep    2
    ${haveProductOnCart}    Run Keyword And Return Status       Wait Until Element Is Visible    ${iconDeleteOnCartPage}
    Run Keyword If          '${haveProductOnCart}' == 'True'    user delete product from cart page
    ...  ELSE               Log To Console                      cart already empty    

user delete product from cart page
    Wait Until Element Is Visible        ${iconDeleteOnCartPage}
    Click Element                        ${iconDeleteOnCartPage}
    Wait Until Element Is Visible        ${buttonHapusOnCartPage}
    Click Element                        ${buttonHapusOnCartPage}
    user cleaning cart page

user click belanja sekarang on cart page
    Wait Until Element Is Visible        ${buttonBelanjaSekarang}
    Click Element                        ${buttonBelanjaSekarang}

# cleaning cart page
#     ${product_count}=    Get Element Count    ${iconDeleteOnCartPage}
#     FOR    ${index}    IN RANGE    ${product_count}
#         Click Element    ${iconDeleteOnCartPage}
#         Wait Until Element Is Not Visible   ${iconDeleteOnCartPage}    timeout=5
#     END
#     Log    All products have been removed from the cart.

user click pilih semua on cart page
    Wait Until Element Is Visible    ${checkboxPilihSemuaOnCartPage}
    Click Element                    ${checkboxPilihSemuaOnCartPage}

user click checkout button on cart page
    user click pilih semua on cart page
    Wait Until Element Is Visible        ${buttonCheckoutOnCartPage}
    Click Element                        ${buttonCheckoutOnCartPage}
