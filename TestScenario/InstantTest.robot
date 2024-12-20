*** Settings ***
Resource    ../PageObject/HomePage.robot
Resource    ../PageObject/DesignPage.robot
Resource    ../PageObject/CheckoutPage.robot
Resource    ../PageObject/DashboardPage.robot
Resource    ../PageObject/OrderListPage.robot
Resource    ../PageObject/CartPage.robot

*** Keywords ***
Access cart page
    Given user is on home page
    When user go to cart page
    Then user is on cart page

Add product to cart
    [Arguments]    ${ModelKardus}    ${TipeUkuranKardus}    ${PanjangKardus}    ${LebarKardus}    ${TinggiKardus}    ${MaterialTypeKardus}    ${KecepatanProduksi}    ${QtyKardus}    ${ShippingType}
    Given user is on design page
    And user add design product    ${ModelKardus}    ${TipeUkuranKardus}    ${PanjangKardus}    ${LebarKardus}    ${TinggiKardus}    ${MaterialTypeKardus}    ${KecepatanProduksi}    ${QtyKardus}
    
Create order via pesan sekarang
    [Arguments]    ${ModelKardus}    ${TipeUkuranKardus}    ${PanjangKardus}    ${LebarKardus}    ${TinggiKardus}    ${MaterialTypeKardus}    ${KecepatanProduksi}    ${QtyKardus}    ${ShippingType}
    Given user go to design page from menu instant
    When Add product to cart    ${ModelKardus}    ${TipeUkuranKardus}    ${PanjangKardus}    ${LebarKardus}    ${TinggiKardus}    ${MaterialTypeKardus}    ${KecepatanProduksi}    ${QtyKardus}    ${ShippingType}
    And user click button pesan sekarang
    Then user is on checkout page
    When user choose shipping type on checkout page    ${ShippingType}
    And user select shipping method on checkout page    ${ShippingType}
    And user click button terapkan shipping on checkout page
    And user get choosen address on checkout page
    And user click button lanjut bayar on checkout page
    And user go to dashboard from checkout page
    Then user is on dashboard page
    When user go to kardoos instant order list page
    Then verify data product on order list page


Create order via cart
    [Arguments]    ${ModelKardus}    ${TipeUkuranKardus}    ${PanjangKardus}    ${LebarKardus}    ${TinggiKardus}    ${MaterialTypeKardus}    ${KecepatanProduksi}    ${QtyKardus}    ${ShippingType}
    Given Access cart page
    When user cleaning cart page
    Then user click belanja sekarang on cart page
    When Add product to cart    ${ModelKardus}    ${TipeUkuranKardus}    ${PanjangKardus}    ${LebarKardus}    ${TinggiKardus}    ${MaterialTypeKardus}    ${KecepatanProduksi}    ${QtyKardus}    ${ShippingType}
    And user click button keranjang on design page
    Then user is on cart page
    When user click checkout button on cart page
    Then user is on checkout page
    When user choose shipping type on checkout page    ${ShippingType}
    And user select shipping method on checkout page    ${ShippingType}
    And user click button terapkan shipping on checkout page
    And user get choosen address on checkout page
    And user click button lanjut bayar on checkout page
    And user go to dashboard from checkout page
    Then user is on dashboard page
    When user go to kardoos instant order list page
    Then verify data product on order list page