*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${inputSearchOnBlogListPage}        xpath=//div[@class='blog-list-left']//input

*** Keywords ***
user is on blog list page
    Wait Until Element Is Visible        ${inputSearchOnBlogListPage}
    Element Should Be Visible            ${inputSearchOnBlogListPage}