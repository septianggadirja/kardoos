*** Settings ***
Library        SeleniumLibrary

*** Variables ***

*** Keywords ***
user is on kebijakan privasi page
    Sleep    5
    ${current_url}=    Get Location
    Log                Current URL: ${current_url}
    Should Contain     ${current_url}                    /kebijakan-privasi 