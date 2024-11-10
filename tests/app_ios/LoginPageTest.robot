***Settings***
Resource          ../../resources/app_ios/pages/LoginPage.robot
Resource          ../../resources/app_ios/pages/ProductsPage.robot

Suite Setup       Suite Setup Config
Test Setup        Test Setup Config
Test Teardown     Test Teardown Config
Suite Teardown    Suite Teardown Config

***Test Cases***
As an iOS user, I should be able to see Error when input incorrect Username and Password
    [Documentation]  User should be able to see error message appear when input incorrect Username and Password
    LoginPage.Open Login Page
    LoginPage.Input Username        MyName
    LoginPage.Input Password        Unknown
    LoginPage.Click button Login
    LoginPage.Verify Error Appear   Provided credentials do not match any user in this service.

As an iOS user, I should be redirected to "Products" Page when input correct Username and Password
    [Documentation]  User should be able to see error message appear when input incorrect Username and Password
    LoginPage.Open Login Page
    LoginPage.Input Username        bob@example.com
    LoginPage.Input Password        10203040
    LoginPage.Click button Login
    ProductsPage.Verify Header "Products" Appear
