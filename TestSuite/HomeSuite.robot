*** Settings ***
Resource            ../Config/${env}.robot
Resource            ../TestScenario/LoginTest.robot
Resource            ../TestScenario/HomeTest.robot
Suite Setup         Begin Web Test
Test Setup          Login to kardoos
Test Teardown       Logout from kardoos
Suite Teardown      End Web Test

*** Test Cases ***
verify user can access design page from header
    [Documentation]        This scenario to test user can access design page from header
    [Tags]                 home    positive    dev    staging     production                             
    Access design page from header

verify user can access katalog page from header
    [Documentation]        This scenario to test user can access katalog page from header
    [Tags]                 home    positive    dev    staging     production                        
    Access katalog page from header

verify user can access tentang kardoos page from header
    [Documentation]        This scenario to test user can access tentang kardoos page from header
    [Tags]                 home    positive    dev    staging     production                           
    Access tentang kardoos page from header

verify user can access instant template page from header based on model
    [Documentation]        This scenario to test user can access instant template page from header based on model
    [Tags]                 home    positive    dev    staging     production                       
    [Template]    Access instant template page from header based on model
    Posh Box
    Mailer Box
    Goodie Box
    Shipping Box

verify user can access faqs page from header
    [Documentation]        This scenario to test user can access faqs page from header
    [Tags]                 home    positive    dev    staging     production                       
    Access faqs page from header

verify user can access tentang kardoos page from footer
    [Documentation]        This scenario to test user can access tentang kardoos page from footer
    [Tags]                 home    positive    dev    staging     production                     
    Access tentang kardoos page from footer

verify user can access material & proses page from footer
    [Documentation]        This scenario to test user can access material & proses page from footer
    [Tags]                 home    positive    dev    staging     production                  
    Access material & proses page from footer

verify user can access inspirasi page from footer
    [Documentation]        This scenario to test user can access inspirasi page from footer
    [Tags]                 home    positive    dev    staging     production                          
    Access inspirasi page from footer

verify user can access blog page from footer
    [Documentation]        This scenario to test user can access blog list page from footer
    [Tags]                 home    positive    dev    staging     production                       
    Access blog list page from footer

verify user can access kardoos instant page from footer
    [Documentation]        This scenario to test user can access kardoos instant page from footer
    [Tags]                 home    positive    dev    staging     production                       
    Access kardoos instant page from footer

verify user can acess design page from footer
    [Documentation]        This scenario to test user can access design page from footer
    [Tags]                 home    positive    dev    staging     production                     
    Access design page from footer

# verify user can access instant template page from footer
#     [Documentation]        This scenario to test user can access instant template page from footer
#     [Tags]                 home    positive    dev    staging     production                   
#     Access instant template page from footer

verify user can access marketplace page from footer
    [Documentation]        This scenario to test user can access marketplace page from footer
    [Tags]                 home    positive    dev    staging     production                     
    Access marketplace page from footer

verify user can access cari supplier page from footer
    [Documentation]        This scenario to test user can access cari supplier page from footer
    [Tags]                 home    positive    dev    staging     production                     
    Access cari supplier page from footer

verify user can access syarat & ketentuan page from footer
    [Documentation]        This scenario to test user can access syarat & ketentuan page from footer
    [Tags]                 home    positive    dev    staging     production                   
    Access syarat & ketentuan page from footer

verify user can access kebijakan privasi page from footer
    [Documentation]        This scenario to test user can access kebijakan privasi page from footer
    [Tags]                 home    positive    dev    staging     production                      
    Access kebijakan privasi page from footer

verify user can access faqs page from footer
    [Documentation]        This scenario to test user can access faqs page from footer
    [Tags]                 home    positive    dev    staging     production                      
    Access faqs page from footer
