***Settings***
Resource  ../../resources/web_browser/pages/LoginPage.robot

Suite Setup     Open SauceDemo
Suite Teardown  Close Browser    ALL

***Test Cases***

As a User, I will see Error when leave Username and Password field as empty and then click Login button
    [Documentation]  Click Login Button without filling Username and Password 
    ...              User should see error on Username, Password, and Login Button
    LoginPage.Click Login button
    LoginPage.Verify error on field Username
    LoginPage.Verify error on field Password
    LoginPage.Verify error "Username is required"

As a User, I will see Error when input incorrect Username and Password then click Login button
    [Documentation]  Click Login Button after filling Username and Password with incorrect value
    ...              User should see error on Username, Password, and Login Button
    LoginPage.Input Username    MyName
    LoginPage.Input Password    Unknown
    LoginPage.Click Login button
    LoginPage.Verify error on field Username
    LoginPage.Verify error on field Password
    LoginPage.Verify error "Username and Password do not match"

As a User, I will not see Login Page anymore when input correct Username and Password then click Login button
    [Documentation]  Click Login Button after filling Username and Password with correct value
    ...              User should not see Login Page anymore and redirected to Page 'https://www.saucedemo.com/inventory.html
    LoginPage.Input Username    standard_user
    LoginPage.Input Password    secret_sauce
    LoginPage.Click Login button
    LoginPage.Verify Login Page is not shown anymore
    Verify Current URL  https://www.saucedemo.com/inventory.html
