*** Settings ***
Resource            ../Config/${env}.robot
Resource            ../TestScenario/LoginTest.robot
Resource            ../TestScenario/MarketplaceTest.robot
Resource            ../TestScenario/InstantTest.robot
Suite Setup         Begin Web Test
Test Setup          Login to kardoos
Test Teardown       Logout from kardoos
Suite Teardown      End Web Test

*** Test Cases ***
verify user can go to design page with material brown selected from instant page
    [Documentation]        This scenario to test user can go to design page with material brown selected from instant page
    [Tags]                 instant    footer    positive    dev             
    Directly go to design page with material brown

verify user can go to design page with material fullcolor selected from instant page
    [Documentation]        This scenario to test user can go to design page with material fullcolor selected from instant page
    [Tags]                 instant    footer    positive    dev           
    Directly go to design page with material fullcolor

verify user can go to design page with model mailer selected from instant page
    [Documentation]        This scenario to test user can go to design page with model mailer selected from instant page
    [Tags]                 instant    footer    positive    dev            
    Directly go to design page with model mailer

verify user can go to design page with model shipping selected from instant page
    [Documentation]        This scenario to test user can go to design page with model shipping selected from instant page
    [Tags]                 instant    footer    positive    dev            
    Directly go to design page with model shipping

verify user can go to design page with model goodiebox selected from instant page
    [Documentation]        This scenario to test user can go to design page with model goodiebox selected from instant page
    [Tags]                 instant    footer    positive    dev            
    Directly go to design page with model goodiebox

verify user can get information about finishing premium white from instant page
    [Documentation]        This scenario to test user can get information about finishing premium white from instant page
    [Tags]                 instant    positive    dev                
    Get finishing premium white on instant page

verify user can order product instant via pesan sekarang
    [Documentation]        This scenario to test user can order product instant via lanjut bayar
    [Tags]                 instant    positive     dev                               
    [Template]             Create order via pesan sekarang
    Mailer Box     Custom     20    10    5    EcoKraft - Brown       Express    57    Reguler
    Shipping Box   Custom     10    20    30   EcoKraft - White       Express    57    Reguler
    # Goodie Box     Custom     20    10    10   Premium - White        Express    57    Reguler

verify user can order product instant via cart
    [Documentation]        This scenario to test user can order product instant via cart
    [Tags]                 instant    positive    dev               
    [Template]             Create order via cart
    Mailer Box     Custom     20    10    5    EcoKraft - White       Reguler    57    Express
    Shipping Box   Custom     10    20    30   Premium - White        Reguler    57    Express
    # Goodie Box     Custom     20    10    10   Ecokraft - Brown       Reguler    57    Express