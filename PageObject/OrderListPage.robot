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

*** Keywords ***
user is on order list page
    Wait Until Element Is Visible        ${listDataOnOrderListPage}
    Element Should Be Visible            ${listDataOnOrderListPage}

verify data product on order list page
    Wait Until Element Is Visible        ${textKecepatanProduksiOnOrderListPage}
    # Element Should Contain               ${textKecepatanProduksiOnOrderListPage}    ${KecepatanProduksi}
    # Element Should Contain               ${textModelOnOrderListPage}                   ${ModelKardus}
    # Element Should Contain               ${textMaterialOnOrderListPage}                ${MaterialNameKardus}
    Element Should Contain               ${textUkuranOnOrderListPage}                  ${PanjangKardus}
    Element Should Contain               ${textUkuranOnOrderListPage}                  ${LebarKardus}
    Element Should Contain               ${textUkuranOnOrderListPage}                  ${TinggiKardus}
    Element Should Contain               ${textQtyOnOrderListPage}                     ${QtyKardus}
    Element Should Contain               ${textAddressNameOnOrderListPage}             ${AddressName}
    Go To                                ${KARDOOS_URL}