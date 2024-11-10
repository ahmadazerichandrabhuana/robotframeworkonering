***Settings***
Resource   ../helpers/CommonAndroid.robot
Resource   ../locators/ProductsPageLocator.robot

*** Keywords ***
Verify Header "Products" Appear
    Verify Element 	 ${textHeaderProducts}

Verify Header "Products" Appear Failed
    Verify Element 	 ${textHeaderProductsIncorrectXPath}
