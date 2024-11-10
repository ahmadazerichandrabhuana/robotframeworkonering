*** Settings ***
Resource    ../../../config/selenium_config.robot

***Keywords***
Verify Element
    [Arguments]     ${element}
    [Documentation]     Wait Element until it is stable at the DOM
    Wait Until Element Is Visible     ${element}

Verify Element With Timeout
    [Arguments]     ${element}    ${timeout}
    [Documentation]     Wait Element until it is stable at the DOM before passing timeout duration
    Wait Until Element Is Visible     ${element}    ${timeout}

Verify Element Not Available
    [Arguments]     ${element}
    [Documentation]     Wait Element until it is not available at the DOM
    Wait Until Element Is Not Visible     ${element}

Verify Element Text
    [Arguments]     ${element}  ${text}
    [Documentation]     Validate Element have specific Text
    Wait Until Element Contains      ${element}  ${text}

Verify Element Text With Timeout
    [Arguments]     ${element}    ${text}    ${timeout}
    [Documentation]     Validate Element have specific Text before passing timeout duration
    Wait Until Element Contains      ${element}  ${text}  ${timeout}

Verify Placeholder Text
    [Arguments]     ${element}      ${text}
    [Documentation]     Validate Text shown on placeholder
    ${value}=        Get Element Attribute    ${element}    placeholder
    Should Be Equal As Strings      ${text}     ${value}

Verify Element Value
    [Arguments]     ${element}      ${value}
    [Documentation]     Validate Element have specific attribute value
    Verify Element      ${element}\[@value="${value}"]

Input Text to Element
    [Arguments]     ${element}      ${value}
    [Documentation]     Clear and Input a text to Input Field
    ...     only when element is ready at DOM.
    Verify Element  ${element}
    Input Text   ${element}      ${value}

Input Password to Element
    [Arguments]     ${element}      ${value}
    [Documentation]     Clear and Input a text to Input Field without log the credential value
    ...     only when element is ready at DOM.
    Verify Element  ${element}
    Input Password   ${element}      $value

Verify Checkbox is Checked
    [Documentation]     Verify checkbox is checked
    [Arguments]     ${element}
    Checkbox Should Be Selected      ${element}

Verify Checkbox is un-Checked
    [Documentation]     Verify checkbox is un-checked
    [Arguments]     ${element}
    Checkbox Should Not Be Selected      ${element}

Verify Current URL
    [Documentation]
    [Arguments]    ${text}
    ${currentUrl}=  Get Location
    Should Be Equal As Strings      ${text}     ${currentUrl}
