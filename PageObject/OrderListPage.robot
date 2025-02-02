*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${listDataOnOrderListPage}                 xpath=//div[@data-label='waiting']/parent::div[@class='ds-tab']/following-sibling::div[@class='ds-section']
${textKecepatanProduksiOnOrderListPage}    xpath=(//label[contains(text(),'Kecepatan Produksi')])[1]
${textModelOnOrderListPage}                xpath=(//label[contains(text(),'Model')]/following-sibling::label[1])[1]
${textMaterialOnOrderListPage}             xpath=(//label[text()='Material']/following-sibling::label[1])[1]
${textUkuranOnOrderListPage}               xpath=(//label[text()='Ukuran']/following-sibling::label[1])[1]
${textQtyOnOrderListPage}                  xpath=(//label[text()='Jumlah']/following-sibling::label[1])[1]
${textAddressNameOnOrderListPage}          xpath=(//label[text()='Alamat Pengiriman']/following-sibling::div/label[1])[1]
${textProductAmountOnOrderListPage}        xpath=(//label[text()='Total belanja'])[1]/following-sibling::label
${textShippingFeeOnOrderListPage}          xpath=(//label[text()='Biaya Pengiriman'])[1]/following-sibling::label
${textGrandTotalOnOrderListPage}           xpath=(//label[text()='Grand Total'])[1]/following-sibling::label

*** Keywords ***
user is on order list page
    Wait Until Element Is Visible        ${listDataOnOrderListPage}
    Element Should Be Visible            ${listDataOnOrderListPage}

verify data product on order list page
    Wait Until Element Is Visible        ${textKecepatanProduksiOnOrderListPage}
    Sleep    5
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