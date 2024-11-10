*** Settings ***
Variables  ../env.yaml
Library    AppiumLibrary     timeout=${default_timeout}     run_on_failure=Log And Capture Error
Library    Process
Library    OperatingSystem

*** Keywords ***
Log And Capture Error
    AppiumLibrary.Capture Page Screenshot
    AppiumLibrary.Log Source

Spawn Appium Server
    Start Process   appium
    ...             -p    ${appium.port}
    ...             -g    logs/appium.log
    ...             shell=true
    ...             stdout=NONE
    Sleep   ${fast_timeout}

Open Android Application
    Open Application    remote_url=${appium.server}
    ...     udid=${android_udid}
    ...     platformName=Android
    ...     automationName=uiautomator2
    ...     deviceName=DeviceName
    ...     appPackage=${app_package}
    ...     appActivity=${app_activity}
    ...     alias=Device
    ...     newCommandTimeout=${appium_timeout}
    ...     printPageSourceOnFindFailure=true
    ...     autoGrantPermissions=true

Suite Setup Config
    Spawn Appium Server

Test Setup Config
    Open Android Application

Test Teardown Config
    Close All Applications

Suite Teardown Config
    Terminate Process
