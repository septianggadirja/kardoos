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
    [Tags]                 instant    footer    positive    dev    staging    production             
    Directly go to design page with material brown

verify user can go to design page with material fullcolor selected from instant page
    [Documentation]        This scenario to test user can go to design page with material fullcolor selected from instant page
    [Tags]                 instant    footer    positive    dev    staging    production           
    Directly go to design page with material fullcolor

# verify user can go to design page with model mailer selected from instant page
#     [Documentation]        This scenario to test user can go to design page with model mailer selected from instant page
#     [Tags]                 instant    footer    positive    dev    staging    production                
#     Directly go to design page with model mailer

# verify user can go to design page with model shipping selected from instant page
#     [Documentation]        This scenario to test user can go to design page with model shipping selected from instant page
#     [Tags]                 instant    footer    positive    dev    staging    production            
#     Directly go to design page with model shipping

# verify user can go to design page with model goodiebox selected from instant page
#     [Documentation]        This scenario to test user can go to design page with model goodiebox selected from instant page
#     [Tags]                 instant    footer    positive    dev    staging    production            
#     Directly go to design page with model goodiebox

verify user can go to design page with model selected from instant page
    [Documentation]        This scenario to test user can go to design page with model poshbox selected from instant page
    [Tags]                 instant    footer    positive    dev    staging    production                
    [Template]             Directly go to design page with based on model
    mailer
    goodie
    shipping
    posh

verify user can get information about finishing premium white from instant page
    [Documentation]        This scenario to test user can get information about finishing premium white from instant page
    [Tags]                 instant    positive    dev    production                        
    Get finishing premium white on instant page

verify user can order product instant via pesan sekarang
    [Documentation]        This scenario to test user can order product instant via lanjut bayar
    [Tags]                 instant    positive     dev    qty    staging    production    failed                                                                            
    [Template]             Create order via pesan sekarang
    Mailer Box     Custom     20    10    5    EcoKraft - Brown       Express    random    Reguler
    Goodie Box     Custom     12    12    12   Premium - Glossy       Reguler    random    Sameday

verify user can order product instant via cart
    [Documentation]        This scenario to test user can order product instant via cart
    [Tags]                 instant    positive    dev     qty    staging    production                                                          
    [Template]             Create order via cart
    Posh Box     Custom     10    10    12    Premium - Doff       Reguler    random    Express
    # Shipping Box   Custom     15    20    10   Premium - Doff         Reguler    57        Sameday
    Goodie Box     Custom     20    10    10   EcoKraft - White       Reguler    57    Express

verify user should choose shipping method after change shipping address on checkout from cart page
    [Documentation]        This scenario to test user should choose shipping method after change shipping address
    [Tags]                 instant    negative    dev    staging                                           
    [Template]             Edit shipping address on checkout from cart page
    Mailer Box     Custom     20    10    5    EcoKraft - White       Reguler    34    Express

verify user should choose shipping method after change shipping address on checkout page
    [Documentation]        This scenario to test user should choose shipping method after change shipping address
    [Tags]                 instant    negative    dev    staging                                       
    [Template]             Edit shipping address on checkout page
    Mailer Box     Custom     20    10    5    EcoKraft - White       Reguler    82    Express

# verify user should choose shipping method after edit qty on checkout page
#     [Documentation]        This scenario to test user should choose shipping method after edit qty on checkout page
#     [Tags]                 instant    negative    dev    staging    test                               
#     [Template]             Edit qty on checkout page
#     Mailer Box     Custom     20    10    5    EcoKraft - White       Reguler    random    Express

verify user can order product instant with voucher code via pesan sekarang
    [Documentation]        This scenario to test user can order product instant with voucher code via lanjut bayar
    [Tags]                 instant    positive     dev    qty    staging                                                             
    [Template]             Create order with voucher code via pesan sekarang
    Mailer Box     Custom     20    10    5    Premium - Glossy       Express    57        Reguler
    # Mailer Box     Custom     20    10    5    Premium - Doff         Reguler    random    Reguler
    # Shipping Box   Custom     20    15    10   Premium - White        Reguler    random    Express
    Goodie Box     Custom     20    10    10   Premium - White        Express    57    Reguler

verify user can order product instant with voucher code via cart
    [Documentation]        This scenario to test user can order product instant with voucher code via cart
    [Tags]                 instant    positive    dev    qty    staging                                                   
    [Template]             Create order with voucher code via cart
    # Mailer Box     Custom     20    10    5    EcoKraft - White       Reguler    57        Express
    Shipping Box   Custom     20    15    10   Premium - White        Reguler    random    Express
    Goodie Box     Custom     20    10    10   EcoKraft - Brown       Reguler    57    Express

verify user can order shipping box with specific flute
    [Documentation]        This scenario to test user can order shipping box with specific flute
    [Tags]                 instant    positive    dev    flute    staging    test                                                   
    [Template]             Create order via cart for specific shipping box with flute
    # Shipping Box   Custom     13    18    10    EcoKraft - Brown      Reguler    random    Reguler    Single Wall
    Shipping Box   Custom     14    19    11    EcoKraft - White      Reguler    random    Express    Double Wall
    Shipping Box   Custom     15    20    12    Premium - White       Reguler    random    Reguler    Double Wall
    # Shipping Box   Custom     16    21    13    Premium - Glossy      Reguler    random    Express    Single Wall
    Shipping Box   Custom     17    22    14    Premium - Doff        Reguler    random    Reguler    Single Wall
