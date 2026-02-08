*** Settings ***
Documentation    All the page objects and keywords of landing page
Library   SeleniumLibrary

*** Variables ***
${Error_Message_Login}    css:.alert-danger

*** Keywords ***

verify items in the Checkout Page and proceed
    Click Element    css:.btn-success