*** Settings ***
Documentation    All the page objects and keywords of landing page
Library   SeleniumLibrary
Resource     ../PageObject/Generic.robot

*** Variables ***
${Shop_page_load}         css:.nav-link

*** Keywords ***
wait until Element is located in the page
    Wait Until element passed is located on Page     ${Shop_page_load}

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