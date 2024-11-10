***Settings***
Resource  ../../resources/web_selenium/pages/LoginPage.robot

Suite Setup     Open SauceDemo
Suite Teardown  Close All Browsers

***Test Cases***
As a User, I will see Header "Swag Labs", input field Username, input field Password, and Login button on the Login Page
    [Documentation]  Check Hedaer, input field Username, input field Password,
    ...              and Login button when open Landing Page
    LoginPage.Verify Login Page
