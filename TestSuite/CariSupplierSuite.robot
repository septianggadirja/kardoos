*** Settings ***
Resource            ../Config/${env}.robot
Resource            ../TestScenario/LoginTest.robot
Resource            ../TestScenario/CariSupplierTest.robot
Suite Setup         Begin Web Test
Test Setup          Login to kardoos
Test Teardown       Logout from kardoos
Suite Teardown      End Web Test

*** Test Cases ***
verify user can get supplier list with search on cari supplier page
    [Documentation]        This scenario to test user can get supplier list with search on cari supplier page
    [Tags]                 cari_supplier    positive    dev    staging     production                           
    Get supplier list with search on cari supplier page

verify user can get supplier list with filter location on cari supplier page
    [Documentation]        This scenario to test user can get supplier list with filter location on cari supplier page
    [Tags]                 cari_supplier    positive    dev    staging     production                         
    Get supplier list with filter by location on cari supplier page

verify user can get supplier detail from cari supplier page
    [Documentation]        This scenario to test user can get supplier detail from cari supplier page
    [Tags]                 cari_supplier    positive    dev    staging     production                       
    Get supplier detail from cari supplier page