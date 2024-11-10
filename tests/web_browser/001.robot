***Settings***
Resource  ../../resources/web_browser/pages/LoginPage.robot

Suite Setup     Open SauceDemo
Suite Teardown  Close Browser    ALL

***Test Cases***
As a User, I will see Header "Swag Labs", input field Username, input field Password, and Login button on the Login Page
    [Documentation]  Check Hedaer, input field Username, input field Password,
    ...              and Login button when open Landing Page
    LoginPage.Verify Login Page
