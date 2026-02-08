*** Settings ***
Documentation  To validate the Login form
Library   SeleniumLibrary
Library    Collections
Library    ../Custom Libraries/Shop.py
Test Setup     Open Browser In Incognito
#Test Setup   open the browser with the Mortgage payment url
#Test Teardown    Close Browser Session
Resource     resource.robot

*** Variables ***
${Error_Message_Login}    css:.alert-danger
${Shop_page_load}         css:.nav-link
@{listofProducts}         Blackberry       Nokia Edge

*** Test Cases ***
#Validate UnSuccessful Login

  #  Fill the login Form       ${user_name}    ${invalid_password}
  #  wait until Element is located in the page     ${Error_Message_Login}
  #  verify error message is correct

Validate Cards display in the shopping page
    Fill The Login Form   ${user_name}    ${valid_password}
    wait until Element is located in the page    ${Shop_page_load}
    Verify Card titles in the Shop page
    CustLib
    #Select the Card                        Blackberry
    add items to cart and checkout        ${listofProducts}

#Select the Form and navigate to Child window
 #   Fill the Login Details and Select the User option

*** Keywords ***

Fill the login form

    Wait Until Element Is Visible    id:username    timeout=10s
    [Arguments]     ${username}      ${password}
    Input Text        id:username     ${username}
    Input Password    id:password     ${password}
    Click Button      signInBtn

wait until it checks and display error message
    Wait Until Element Is Visible    ${Error_Message_Login}           10s
    
wait until Element is located in the page
    [Arguments]        ${element}
    Wait Until Element Is Visible     ${element}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               

verify error message is correct
    ${result} =  Get Text    css:.alert-danger
    Should Be Equal As Strings    ${result}   Incorrect username/password.
    Element Text Should Be    ${Error_Message_Login}  Incorrect username/password.
    
Verify Card titles in the Shop page
    @{expectedList} =   Create List   iphone X   Samsung Note 8   Nokia Edge    Blackberry
    ${elements} =   Get WebElements    css:.card-title
    @{actualList} =  Create List
    FOR   ${element}   IN    @{elements}
        Element Should Be Visible     ${element}
        ${text}=    Get Text    ${element}
        Log         ${text}
        Append To List   ${actualList}     ${text}
    END
    Lists Should Be Equal    ${expectedList}     ${actualList}

#Select the Card
 #     [Arguments]       ${cardName}
 #     ${elements} =   Get WebElements    css:.card-title
 #     ${index} =    Set Variable     1
#      FOR    ${element}   IN   @{elements}
 #         ${text} =    Get Text    ${element}
 #         Exit For Loop If     '${cardName}' == '${text}'
 #         ${index} =    Evaluate    ${index}+1
 #     END
  #    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button
          
Fill the Login Details and Select the User option
       Input Text     id:username      rahulshettyacademy
       Input Password   id:password    learning
       Click Element    css:input[value='user']
       Wait Until Element Is Visible    css:.modal-body
       Click Button        id:okayBtn
       Wait Until Element Is Visible    css:.modal-body
       Select From List By Value    css:select.form-control     tech
       Select Checkbox     terms
       Checkbox Should Be Selected    terms
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          