***Settings***
Resource          ../../resources/app_ios/pages/ProductsPage.robot

Suite Setup       Suite Setup Config
Test Setup        Test Setup Config
Test Teardown     Test Teardown Config
Suite Teardown    Suite Teardown Config

***Test Cases***
As an iOS user, I should be able to see page "Products" when first Open the Apps
    [Documentation]  User should be redirected to page "Products" but the verification should be Failed
    ProductsPage.Verify Header "Products" Appear Failed
