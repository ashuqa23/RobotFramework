*** Settings ***
Documentation    A resource file with reusable keywords and variables
Library   SeleniumLibrary
Library    Collections

*** Variables ***
${user_name}           rahulshettyacademy
${invalid_password}    12345
${valid_password}      learning
${url}     https://rahulshettyacademy.com/loginpagePractise

*** Keywords ***
#open the browser with the Mortgage payment url
#    Open Browser In Incognito
 #   Create Webdriver      Chrome
  #  Go To    ${url}

Open Browser In Incognito
          ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
          Call Method    ${options}    add_argument    --incognito
          Call Method    ${options}    add_argument    --start-maximized
          Create Webdriver    Chrome   options=${options}

Open Browser With Options
    [Arguments]    ${browser_name}

    IF    '${browser_name}' == 'Chrome'
        ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
        Call Method    ${options}    add_argument    --incognito
        Create WebDriver    Chrome    options=${options}

    ELSE IF  '${browser_name}' == 'Edge'
        ${options}=    Evaluate    sys.modules['selenium.webdriver'].EdgeOptions()    sys
        Call Method    ${options}    add_argument    --inprivate
        Call Method    ${options}    add_argument    --start-maximized
        Create WebDriver    Edge    options=${options}

    ELSE IF    '${browser_name}' == 'Firefox'
        ${options}=    Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()    sys
        Call Method    ${options}    add_argument    -private
        Create WebDriver    Firefox    options=${options}

    ELSE
        Fail    Browser not supported: ${browser_name}
    END

    Go To    ${url}


    Go To    ${url}

Close Browser Session
    Close Browser
    
Wait Until element passed is located on Page
    [Arguments]         ${page_locator}
    Wait Until Element Is Visible      ${page_locator}        10s