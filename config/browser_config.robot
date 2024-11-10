*** Variables ***
${BROWSER}              chromium
${HEADLESS}             False
${KEYWORD_TIMEOUT}      5s
${BROWSER_TIMEOUT}      5s

*** Settings ***
Library     Browser      auto_closing_level=TEST    run_on_failure=Log And Capture Error    timeout=${BROWSER_TIMEOUT}
Library     String
Variables   ../env.yaml

*** Keywords ***
Log And Capture Error
    Take Screenshot
    ${source}=    Get Page Source
    Log    ${source}

Open New Browser
    [Arguments]     ${url}
    New Browser     ${BROWSER}      headless=${HEADLESS}
    ${context}=    Get Device    Desktop Chrome
    New Context   &{context}
    New Page  ${url}
    Set Browser Timeout     ${KEYWORD_TIMEOUT}

Open SauceDemo
    Open New Browser    ${saucedemo_url}
