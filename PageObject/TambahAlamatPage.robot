*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${inputNamaLengkapOnAddAddressPage}        xpath=//input[@name='name']
${inputPhoneNumberOnAddAddressPage}        xpath=//input[@name='phoneNumber']
${inputCompanyNameOnAddAddressPage}        xpath=//input[@name='companyName']
${inputAddressOnAddAddressPage}            xpath=//textarea[@name='address']
${dropdownPropinsiOnAddAddressPage}        xpath=//label[text()='Propinsi']/following-sibling::div//div[text()='Select...']

*** Keywords ***

