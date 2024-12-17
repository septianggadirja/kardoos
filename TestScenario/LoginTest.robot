*** Settings ***
Resource    ../PageObject/HomePage.robot
Resource    ../PageObject/LoginPage.robot

*** Keywords ***
Login to kardoos
    Given user is on home page
    When user go to login page
    Then user is on login page
    When user input credential for login
    And user click button masuk for login
    Then user success to login

Logout from kardoos
    When user reload page
    And user click button logout
    And user confirm to logout
    Then user success to logout