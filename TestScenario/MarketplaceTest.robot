*** Settings ***
Resource    ../PageObject/HomePage.robot
Resource    ../PageObject/KatalogPage.robot
Resource    ../PageObject/ProductDetailPage.robot
Resource    ../PageObject/SupplierDetailPage.robot

*** Keywords ***
Get catalog list on marketplace
    Given user is on home page
    When user go to marketplace page
    Then user is on katalog page

Get product catalog list with filter by jenis packaging
    Given Get catalog list on marketplace
    When user get product list on katalog page
    And user filter product based on jenis packaging on katalog page
    Then verify product list filtered by jenis packaging on katalog page

Get product catalog list with search
    Given Get catalog list on marketplace
    When user get product list on katalog page
    And user search product on katalog page
    Then verify product list displayed based on search result on katalog page

Get product detail from product catalog
    Given Get catalog list on marketplace
    When user get product list on katalog page
    And user go to product detail from katalog page
    Then verify data on product detail page

Get supplier list with filter by location
    Given Get catalog list on marketplace
    When user get supplier list on katalog page
    And user filter supplier based on location on katalog page
    Then verify supplier list filtered by lokasi on katalog page

Get supplier list with search
    Given Get catalog list on marketplace
    When user get supplier list on katalog page
    And user search supplier on katalog page
    Then verify supplier list displayed based on search result on katalog page

Get supplier detail from supplier catalog
    Given Get catalog list on marketplace
    When user get supplier list on katalog page
    And user go to supplier detail from katalog page
    Then verify data on supplier detail page