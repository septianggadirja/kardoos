*** Settings ***
Resource            ../Config/${env}.robot
Resource            ../TestScenario/LoginTest.robot
Resource            ../TestScenario/MarketplaceTest.robot
Suite Setup         Begin Web Test
Test Setup          Login to kardoos
Test Teardown       Logout from kardoos
Suite Teardown      End Web Test

*** Test Cases ***
verify user can get catalog on marketplace page
    [Documentation]        This scenario to test user can get product catalog on marketplace
    [Tags]                 marketplace    positive    dev    staging     production            
    Get catalog list on marketplace
   
verify user can get product catalog with filter jenis packaging on katalog page
    [Documentation]        This scenario to test user can get product catalog with filter by jenis packaging on marketplace
    [Tags]                 marketplace    positive    dev    staging     production                 
    Get product catalog list with filter by jenis packaging

verify user can get product catalog with search on katalog page
    [Documentation]        This scenario to test user can get product catalog with search on marketplace
    [Tags]                 marketplace    positive    dev    staging     production                    
    Get product catalog list with search

verify user can get product detail from katalog page
    [Documentation]        This scenario to test user can get product detail from marketplace
    [Tags]                 marketplace    positive    dev    staging     production                      
    Get product detail from product catalog

verify user can get supplier list with filter location on katalog page
    [Documentation]        This scenario to test user can get supplier list with filter by location on marketplace
    [Tags]                 marketplace    positive   dev    staging     production                   
    Get supplier list with filter by location

verify user can get supplier list with search on katalog page
    [Documentation]        This scenario to test user can get supplier list with search on marketplace
    [Tags]                 marketplace    positive    dev    staging     production                        
    Get supplier list with search

verify user can get supplier detail from katalog page
    [Documentation]        This scenario to test user can get supplier detail from marketplace
    [Tags]                 marketplace    positive    dev    staging     production                       
    Get supplier detail from supplier catalog