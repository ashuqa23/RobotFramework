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
    Create Webdriver    Chrome    options=${options}
    Go To    ${url}

Close Browser Session
    Close Browser