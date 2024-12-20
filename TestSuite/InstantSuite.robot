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
verify user can order product instant via pesan sekarang
    [Documentation]        This scenario to test user can order product instant via lanjut bayar
    [Tags]                 instant    positive     dev    staging                       
    [Template]             Create order via pesan sekarang
    Mailer Box     Custom     20    10    5    EcoKraft - Brown       Express    57    Reguler
    # Shipping Box   Custom     20    10    5    EcoKraft   White Kraft       Reguler    57    Express
    # Mailer Box     Custom     20    10    5    Premium    Premium Doff      Express    57    Reguler
    # Shipping Box   Custom     20    10    5    Premium    Premium Glossy    Reguler    57    Express
    # Mailer Box     Custom     20    10    5    Premium    Premium Doff      Express    57    Reguler

verify user can order product instant via cart
    [Documentation]        This scenario to test user can order product instant via cart
    [Tags]                 instant    positive    dev    staging           
    [Template]             Create order via cart
    Mailer Box     Custom     20    10    5    EcoKraft - White       Express    57    Reguler