***Settings***
Resource   ../helpers/CommonAndroid.robot
Resource   ../locators/MenuPageLocator.robot

*** Keywords ***
Select Menu "Catalog"
    Click Element  	 ${iconHamburger}
    Click Element  	 ${textMenuCatalog}

Select Menu "Log In"
    Click Element  	 ${iconHamburger}
    Click Element  	 ${textMenuLogin}

