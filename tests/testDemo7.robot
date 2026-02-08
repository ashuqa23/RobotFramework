*** Settings ***
Documentation  To validate the Login form
Library   SeleniumLibrary
Library    Collections
Library    ../Custom Libraries/Shop.py
Test Setup   Open Browser With Options     Firefox
#Test Setup     Open Browser In Incognito   Firefox
#Test Setup   open the browser with the Mortgage payment url
Test Teardown    Close Browser Session
Resource     ../PageObject/Generic.robot
Resource     ../PageObject/LandingPage.robot
Resource     ../PageObject/ShopPage.robot
Resource     ../PageObject/CheckoutPage.robot
Resource     ../PageObject/ConfirmationPage.robot

*** Variables ***
@{listofProducts}         Blackberry       Nokia Edge
${country_name}          India

*** Test Cases ***
Validate UnSuccessful Login

    LandingPage.Fill the Login Form       ${user_name}    ${invalid_password}
    LandingPage.wait until Element is located in the page
    LandingPage.verify error message is correct

Validate Cards display in the shopping page
    LandingPage.Fill The Login Form   ${user_name}    ${valid_password}
    ShopPage.wait until Element is located in the page
    ShopPage.Verify Card titles in the Shop page
    #CustLib
    #Select the Card                        Blackberry
    add items to cart and checkout        ${listofProducts}
    CheckoutPage.verify items in the Checkout Page and proceed
    ConfirmationPage.Enter the Country and select the terms    ${country_name}
    ConfirmationPage.Purchase the Product and Confirm the Purchase

#Select the Form and navigate to Child window
 #   Fill the Login Details and Select the User option

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
          
#Fill the Login Details and Select the User option
 #      Input Text     id:username      rahulshettyacademy
 #      Input Password   id:password    learning
 #      Click Element    css:input[value='user']
 #      Click Button        id:okayBtn
  #     Wait Until Element Is Visible    css:.modal-body
 #      Select From List By Value     css:select.form-control     teach
  #     Select Checkbox     terms
 #      Checkbox Should Be Selected    terms

          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          