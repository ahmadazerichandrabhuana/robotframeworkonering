# Robot Framework - One Ring
The Swiss Army Knife for Test Automation using Robot Framework - One Ring to Rule Them All!

You can refer to my 5 other Repositories if you want specific usage :
- [API Test Automation](https://github.com/ahmadazerichandrabhuana/robotframeworkapi)
- [Android Test Automation](https://github.com/ahmadazerichandrabhuana/robotframeworkandroid)
- [IOS Test Automation](https://github.com/ahmadazerichandrabhuana/robotframeworkios)
- [Web Test Automation using Browser Library](https://github.com/ahmadazerichandrabhuana/robotframeworkbrowser)
- [Web Test Automation using Selenium Library](https://github.com/ahmadazerichandrabhuana/robotframeworkselenium)

## Requirements

1. Install [VS Code](https://code.visualstudio.com/) or any Code Editor you're comfort with.
2. Install [python](https://www.python.org/), preferably version **3.9.10** (that's the one I used and having no issue).
3. Make sure `pip` also installed together with python. If it is not automatically installed, refer to [Python Crash Course](https://ehmatthes.github.io/pcc/chapter_12/installing_pip.html).
4. Update python to your PATH file. Refer [here](https://realpython.com/add-python-to-path/), this website covered configuration for Windows, Linux, and MacOS. Or, if you prefer using python version management tools, refer to [this article](https://medium.com/@zorozeri/how-to-install-pyenv-and-manage-pythonversion-on-your-local-machine-241b119b7ae9) for using [pyenv](https://github.com/pyenv/pyenv).
5. Install [JDK](https://www.oracle.com/java/technologies/downloads/).
6. Install [Android Studio](https://developer.android.com/studio/install), and install Android SDK using Android Studio.
7. Update JAVA_HOME and ANDROID_HOME to your PATH file. There is no easy way to explain this. You can refer [here](https://medium.com/@zorozeri/setting-up-java-home-5abae0118bfe) or Google it.
8. Install [XCode](https://apps.apple.com/us/app/xcode/id497799835?mt=12), and XCode Command Line Tools (`xcode-select --install`).
9. Install [NodeJS](https://nodejs.org/en/download/package-manager).
10. Install [Appium](https://appium.io/docs/en/2.2/quickstart/install/) then install appium driver `uiautomator2` and install appium driver `xcuitest`.
11. Install and run [appium-doctor](https://www.npmjs.com/package/appium-doctor) to make sure all your appium's dependencies are OK, trouble shoot if any red "x" appears (you need to google it yourself).
12. Install [ADB](https://www.xda-developers.com/install-adb-windows-macos-linux/), or add ADB installed from Android Studio into your PATH file.
13. Download and install this [Demo Apps](https://github.com/saucelabs/my-demo-app-rn/releases), `.apk` file for Android Device / Android Emulator, `.ipa` file for iOS Real Device or extract `.zip` file and put the extracted `.app` file into iOS Simulator. Credit to [Wim Selles](https://github.com/wswebcreation).
14. Download and open this code repository on your local Code Editor and run these 2 commands :
    ```
    pip install -r requirements.txt
    rfbrowser init
    ```
    - If the pip process is failed, try to downgrade your python version. I used python `3.9.10` when creating this repository (that's why I suggest it on requirements above). When I tried on different local machine with python `3.13.0` somehow the pip process is error.
    - If `rfbrowser init` is failed, you may forgot to install NodeJS, install it first. Or on MacOS/Linux you might need to run the command with prefix `sudo` (need to put your Local Machine’s Password as well).

## Device Connection - Android

Connect your device to your computer, check it's udid : 
```
adb devices
```
Put it on file `env.yaml` line 7 : 
```
android_udid: {your Android device udid}
sample : 
android_udid: emulator-5554
```
## Device Connection - iOS

Connect your device to your computer, or open iOS Simulator, and check it's udid (or `identifier`) from XCode (Open XCode go to menu `Window` then choose `Device and Simulators`). 

Put the udid/identifier on file `env.yaml` line 8 : 
```
ios_udid: {your iOS device udid/identifier}
sample : 
ios_udid: 7XXDXXXX-FXXX-XX9X-8XXX-XXXXCXXXFXXX
```

## Run Tests
* Run all tests : 
   ```
   robot tests
   ```

* Run specific platform : 
   ```
   robot tests/{platform_folder}
   sample :
   robot tests/api
   robot tests/app_android
   robot tests/app_ios
   robot tests/web_browser
   robot tests/web_selenium
   ```

* Run specific file test : 
   ```
   robot tests/{platform_folder}/{test_file_name_with_extension.robot}
   sample :
   robot tests/api/ContactListAPITest.robot
   robot tests/app_android/001.robot
   robot tests/app_ios/001.robot
   robot tests/web_browser/001.robot
   robot tests/web_selenium/001.robot
   ```

## Open Test Report
   MacOs : 

    open report.html
   Windows : 

    start report.html
   Or just drag and drop file `report.html` into your Browser.

## Open Test Log
   MacOs : 

    open log.html
   Windows : 

    start log.html
   Or just drag and drop file `log.html` into your Browser.

## Short Repository Explanation

This sample Test Automation consists of 4 main folders : 

* config
   ```
   Contains basic configuration of Variables, Settings, and Keyword wich will be used globally on each platform
   ```
* log
   ```
   This folder will be filled with screenshot and logs from test execution, with one initial .txt file as placeholder only
   ```
* resources
   ```
   Consists of 3 more folders inside each platform :
   > helpers  : contains any action which might be used globally on any pages
   > locators : contains web element or page element for each specific web pages or apps page screens
   > pages    : contains actions which will be performed on each specific web pages or apps page screens
   ```
* tests
   ```
   Contains test cases for each platform
   ```

Apart from these 4 folders, this sample also using `env.yaml` file which can be used to store configuration-specific data.
