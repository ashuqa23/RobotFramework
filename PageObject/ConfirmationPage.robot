*** Settings ***
Documentation    All the page objects and keywords of landing page
Library   SeleniumLibrary
Resource     ../PageObject/Generic.robot

*** Variables ***
${Shop_page_load}                   css:.nav_link
#${Country_location}                //a[text()='India']

*** Keywords ***

Enter the Country and select the terms
    [Arguments]          ${country_name}
    Input Text           country          ${country_name}
    Wait Until element passed is located on Page       //a[text()='${country_name}']
    Click Element        //a[text()='${country_name}']
    Click Element        css:.checkbox label

Purchase the Product and Confirm the Purchase
    Click Button      css:.btn-success
    Page Should Contain     Success!