*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${listDataOnOrderListPage}                 xpath=//div[@data-label='waiting']/parent::div[@class='ds-tab']/following-sibling::div[@class='ds-section']
${textKecepatanProduksiOnOrderListPage}    xpath=(//label[contains(text(),'Kecepatan Produksi')])[1]
${textModelOnOrderListPage}                xpath=(//div[contains(text(),'Model')]/following-sibling::div[1])[1]
${textMaterialOnOrderListPage}             xpath=(//div[text()='Material']/following-sibling::div[1])[1]
${textUkuranOnOrderListPage}               xpath=(//div[text()='Ukuran']/following-sibling::div[1])[1]
${textQtyOnOrderListPage}                  xpath=(//div[text()='Jumlah']/following-sibling::div[1])[1]
${textAddressNameOnOrderListPage}          xpath=(//label[text()='Alamat Pengiriman']/parent::div/following-sibling::div/div[1])[1]/div[1]
${textProductAmountOnOrderListPage}        xpath=(//div[text()='Total Belanja'])[1]/following-sibling::div
${textShippingFeeOnOrderListPage}          xpath=(//div[text()='Biaya Pengiriman'])[1]/following-sibling::div
${textGrandTotalOnOrderListPage}           xpath=(//div[text()='Grand Total'])[1]/following-sibling::div
${textKurirNameOnOrderListPage}            xpath=(//label[contains(text(),'Kecepatan Produksi')])[1]

*** Keywords ***
user is on order list page
    Wait Until Element Is Visible        ${listDataOnOrderListPage}
    Element Should Be Visible            ${listDataOnOrderListPage}

verify data product on order list page
    Wait Until Element Is Visible        ${textKecepatanProduksiOnOrderListPage}           timeout=10
    Sleep    2
    Element Should Contain               ${textUkuranOnOrderListPage}                      ${PanjangKardus}
    Element Should Contain               ${textUkuranOnOrderListPage}                      ${LebarKardus}
    Element Should Contain               ${textUkuranOnOrderListPage}                      ${TinggiKardus}
    Element Should Contain               ${textQtyOnOrderListPage}                         ${QtyKardus}
    Element Should Contain               ${textAddressNameOnOrderListPage}                 ${AddressName}
    Element Should Contain               ${textProductAmountOnOrderListPage}               ${TotalProductAmount}
    Element Should Contain               ${textShippingFeeOnOrderListPage}                 ${TotalShippingAmount}
    Element Should Contain               ${textKecepatanProduksiOnOrderListPage}           ${KecepatanProduksi}
    Element Should Contain               ${textModelOnOrderListPage}                       ${ModelKardus}
    Run Keyword If                       '${MaterialTypeKardus}' == 'EcoKraft - Brown'     Element Should Contain            ${textMaterialOnOrderListPage}    Brown Kraft
    ...  ELSE IF                         '${MaterialTypeKardus}' == 'EcoKraft - White'     Element Should Contain            ${textMaterialOnOrderListPage}    White Kraft
    ...  ELSE                            Element Should Contain                            ${textMaterialOnOrderListPage}    Premium
    Element Should Contain               ${textGrandTotalOnOrderListPage}                  ${TotalAmount}
    # Element Should Contain               ${textMaterialOnOrderListPage}                ${MaterialTypeKardus}

verify data product flute on order list page
    Wait Until Element Is Visible        ${textKecepatanProduksiOnOrderListPage}           timeout=10
    Sleep    2
    Element Should Contain               ${textUkuranOnOrderListPage}                      ${PanjangKardus}
    Element Should Contain               ${textUkuranOnOrderListPage}                      ${LebarKardus}
    Element Should Contain               ${textUkuranOnOrderListPage}                      ${TinggiKardus}
    Element Should Contain               ${textQtyOnOrderListPage}                         ${QtyKardus}
    Element Should Contain               ${textAddressNameOnOrderListPage}                 ${AddressName}
    Element Should Contain               ${textProductAmountOnOrderListPage}               ${TotalProductAmount}
    Element Should Contain               ${textShippingFeeOnOrderListPage}                 ${TotalShippingAmount}
    Element Should Contain               ${textKecepatanProduksiOnOrderListPage}           ${KecepatanProduksi}
    Element Should Contain               ${textModelOnOrderListPage}                       ${ModelKardus}
    Run Keyword If                       '${MaterialTypeKardus}' == 'EcoKraft - Brown'     Element Should Contain            ${textMaterialOnOrderListPage}    Brown Kraft
    ...  ELSE IF                         '${MaterialTypeKardus}' == 'EcoKraft - White'     Element Should Contain            ${textMaterialOnOrderListPage}    White Kraft
    ...  ELSE                            Element Should Contain                            ${textMaterialOnOrderListPage}    Premium
    Element Should Contain               ${textGrandTotalOnOrderListPage}                  ${TotalAmount}
    Element Should Contain               ${textModelOnOrderListPage}                       ${FluteShipping}