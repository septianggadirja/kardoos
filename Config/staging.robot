*** Settings ***
Library    SeleniumLibrary        timeout=60        run_on_failure=Capture Page Screenshot
Library    String
Library    BuiltIn
Library    OperatingSystem

*** Variables ***
${BROWSER}                  headlesschrome
${KARDOOS_URL}              https://staging.kardoos.co.id/
${KARDOOS_DAHBOARD_URL}     https://staging.kardoos.co.id/dashboard
${ACCOUNT_EMAIL}            testangga21+kardoos@gmail.com
${ACCOUNT_PASSWORD}         qwe123

*** Keywords ***
Begin Web Test
    Remove Files                    /kardoos/report/*.png
    # Open Browser                    about:blank            ${BROWSER}    options=add_argument("--headless=new")
    Open Browser                    about:blank            ${BROWSER}    
    Set Window Size                 1920    1080
    Go To                           ${KARDOOS_URL}

End Web Test
    Close Browser
