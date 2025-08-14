*** Settings ***
Resource            ../Config/${env}.robot
Resource            ../TestScenario/LoginTest.robot
Resource            ../TestScenario/AddressTest.robot
Suite Setup         Begin Web Test
Test Setup          Login to kardoos
Test Teardown       Logout from kardoos
Suite Teardown      End Web Test

*** Test Cases ***
# verify user can add address from settings
#     [Documentation]        This scenario to test user can add address from settings
#     [Tags]                 settings    address    positive    dev    staging     production                                        
#     Tambah alamat pengiriman

# verify user can edit address from settings
#     [Documentation]        This scenario to test user can edit address from settings
#     [Tags]                 settings    address    positive    dev    staging     production                                                
#     Ubah alamat pengiriman

# verify user can delete address from settings
#     [Documentation]        This scenario to test user can edit address from settings
#     [Tags]                 settings    address    positive    dev    staging     production                                                
#     Hapus alamat pengiriman