*** Settings ***
Documentation  To validate the Login form
Library   SeleniumLibrary
Library    Collections
Library    String
Test Setup    Open Browser In Incognito
#Test Setup   open the browser with the Mortgage payment url
Test Teardown    Close Browser Session
Resource     resource.robot

*** Variables ***
${Error_Message_Login}    css:.alert-danger
${Shop_page_load}         css:.nav-link

*** Test Cases ***
Validate Child window Functionality
    Select the link of Child window
    Verify the user is Switched to Child window
    Grab the Email id in the Child window
    Switch to Parent window and enter the Email


*** Keywords ***
Select the link of Child window
    Click Element    css:.blinkingText
    Sleep       5
    
Verify the user is Switched to Child window   
    Switch Window      NEW 
    Element Text Should Be    css:h1   DOCUMENTS REQUEST
    
Grab the Email id in the Child window
    ${text} =   Get Text    css:.red
    @{words} =   Split String    ${text}     at
    ${text_split} =  Get From List    ${words}     1
    log    ${text_split}
    @{words_2} =   Split String     ${text_split}     
    ${email} =    Get From List    ${words_2}   0
    Set Global Variable     ${email}
    
Switch to Parent window and enter the Email
     Switch Window      MAIN
     Title Should Be    LoginPage Practise | Rahul Shetty Academy
     Input Text     id:username      ${email}
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          