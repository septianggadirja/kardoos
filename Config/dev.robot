*** Settings ***
Library    SeleniumLibrary        timeout=10        run_on_failure=Capture Page Screenshot
Library    String
Library    BuiltIn
Library    OperatingSystem

*** Variables ***
${BROWSER}                  chrome
${KARDOOS_URL}              https://dev.kardoos.co.id/
${KARDOOS_DAHBOARD_URL}     https://dev.kardoos.co.id/dashboard
${ACCOUNT_EMAIL}            testangga21+kardoos@gmail.com
${ACCOUNT_PASSWORD}         qwe123

*** Keywords ***
Begin Web Test
    Remove Files                    /Users/muhammad.anggadirja/Documents/kardoos/report/*.png
    Open Browser                    about:blank            ${BROWSER}
    Set Window Size                 1920    1080
    Go To                           ${KARDOOS_URL}

End Web Test
    Close Browser
