***Settings***
Resource   ../helpers/CommonIOS.robot
Resource   ../locators/MenuPageLocator.robot

*** Keywords ***
Select Menu "Catalog"
    Click Element  	 ${iconMenu}
    Click Element  	 ${textMenuCatalog}

Select Menu "Log In"
    Click Element  	 ${iconMenu}
    Click Element  	 ${textMenuLogin}
