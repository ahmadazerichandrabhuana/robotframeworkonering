***Settings***
Resource   ../helpers/CommonAndroid.robot
Resource   MenuPage.robot
Resource   ../locators/LoginPageLocator.robot

*** Keywords ***
Open Login Page
    MenuPage.Select Menu "Log In"

Input Username
    [Arguments]  ${text}
    Input Text to Element  	 ${inputUsername}  ${text}

Input Password
    [Arguments]  ${text}
    Input Text to Element  	 ${inputPassword}  ${text}

Click button Login
    Click Element            ${buttonLogin}

Verify Error Appear
    [Arguments]  ${text}
    Verify Element Text      ${textErrorLogin}  ${text} 