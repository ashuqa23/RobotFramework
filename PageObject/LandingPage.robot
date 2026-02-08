*** Settings ***
Documentation    All the page objects and keywords of landing page
Library   SeleniumLibrary
Resource     ../PageObject/Generic.robot

*** Variables ***
${Error_Message_Login}    css:.alert-danger

*** Keywords ***
Fill the login form
    Wait Until Element Is Visible    id:username    timeout=10s
    [Arguments]     ${username}      ${password}
    Input Text        id:username     ${username}
    Input Password    id:password     ${password}
    Click Button      signInBtn

wait until it checks and display error message
    Wait Until element passed is located on Page   ${Error_Message_Login}           10s

wait until Element is located in the page
    Wait Until element passed is located on Page     ${Error_Message_Login}

verify error message is correct
    ${result} =  Get Text    css:.alert-danger
    Should Be Equal As Strings    ${result}   Incorrect username/password.
    Element Text Should Be    ${Error_Message_Login}  Incorrect username/password.