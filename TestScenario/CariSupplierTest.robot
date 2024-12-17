*** Settings ***
Resource    HomeTest.robot
Resource    ../PageObject/SupplierDetailPage.robot

*** Keywords ***
Get supplier list with search on cari supplier page
    Given Access cari supplier page from footer
    When user input supplier name for search on cari supplier page
    Then verify supplier list displayed based on search result on cari supplier page

Get supplier list with filter by location on cari supplier page
    Given Access cari supplier page from footer
    When user filter supplier based on location on cari supplier page
    Then verify supplier list filtered by lokasi on cari supplier page

Get supplier detail from cari supplier page
    Given Access cari supplier page from footer
    When user go to supplier detail from cari supplier page
    Then verify data on supplier detail page