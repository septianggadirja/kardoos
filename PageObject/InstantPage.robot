*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${textMenuKardosInstant}                           xpath=//a[@href='/instant' and text()='Kardoos Instant']
${buttonEcoBlackPrintOnInstantPage}                xpath=//a/button[@class='button-eco']
${buttonFullColorPrintOnInstantPage}               xpath=//a/button[@class='button-color']
${buttonDesignSekarangMailerBoxOnInstantPage}      xpath=//a//h3[text()='Mailer Box']/parent::div/following-sibling::button
${buttonDesignSekarangShippingBoxOnInstantPage}    xpath=//a//h3[text()='Shipping Box']/parent::div/following-sibling::button
${buttonDesignSekarangGoodieBoxOnInstantPage}      xpath=//a//h3[text()='Goodie Box']/parent::div/following-sibling::button
${buttonCobaSekarangOnInstantPage}                 xpath=//a/button[text()='Coba Sekarang']
${buttonCobaSekarang!OnInstantPage}                xpath=//a/button[text()='Coba Sekarang!']

*** Keywords ***
user is on instant page
    Wait Until Element Is Visible        ${textMenuKardosInstant}
    Element Should Be Visible            ${textMenuKardosInstant}

user click button eco black print on instant page
    Wait Until Element Is Visible    ${buttonEcoBlackPrintOnInstantPage}
    Scroll Element Into View         ${buttonEcoBlackPrintOnInstantPage}
    Click Element                    ${buttonEcoBlackPrintOnInstantPage}

user click button full color print on instant page
    Wait Until Element Is Visible    ${buttonFullColorPrintOnInstantPage}
    Scroll Element Into View         ${buttonFullColorPrintOnInstantPage}
    Click Element                    ${buttonFullColorPrintOnInstantPage}

user click button mailer box design sekarang on instant page
    Wait Until Element Is Visible    ${buttonDesignSekarangMailerBoxOnInstantPage}
    Scroll Element Into View         ${buttonDesignSekarangMailerBoxOnInstantPage}
    Click Element                    ${buttonDesignSekarangMailerBoxOnInstantPage}

user click button shipping box design sekarang on instant page
    Wait Until Element Is Visible    ${buttonDesignSekarangShippingBoxOnInstantPage}
    Scroll Element Into View         ${buttonDesignSekarangShippingBoxOnInstantPage}
    Click Element                    ${buttonDesignSekarangShippingBoxOnInstantPage}

user click button goodie box design sekarang on instant page
    Wait Until Element Is Visible    ${buttonDesignSekarangGoodieBoxOnInstantPage}
    Scroll Element Into View         ${buttonDesignSekarangGoodieBoxOnInstantPage}
    Click Element                    ${buttonDesignSekarangGoodieBoxOnInstantPage}

user click button coba sekarang on instant page
    Wait Until Element Is Visible    ${buttonCobaSekarangOnInstantPage}
    Scroll Element Into View         ${buttonCobaSekarangOnInstantPage}
    Click Element                    ${buttonCobaSekarangOnInstantPage}

user click button coba sekarang! on instant page
    Wait Until Element Is Visible    ${buttonCobaSekarang!OnInstantPage}
    Scroll Element Into View         ${buttonCobaSekarang!OnInstantPage}
    Click Element                    ${buttonCobaSekarang!OnInstantPage}