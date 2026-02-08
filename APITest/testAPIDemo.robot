*** Settings ***
Library      Collections
Library      RequestsLibrary

*** Variables ***
${base_url}      https://rahulshettyacademy.com
${book_id}
${book_name}      RobotFramework

*** Test Cases ***
Play around with Dictionary
    &{data}=    Create Dictionary       name=rahulshetty      course=robot     website=rahulshettyacademy.com
    log     ${data}
    Dictionary Should Contain Key       ${data}      name
    log     ${data}[name]
    ${url}=    Get From Dictionary      ${data}        website
    log     ${url}
    
Add Book into Library dataBase
    &{req_body}=    Create Dictionary    name=${book_name}     isbn=9824943      aisle=324053     author=rahulshetty
    ${response}=    POST     ${base_url}/Library/Addbook.php     json=${req_body}      expected_status=200
    log     ${response.json()}
    Dictionary Should Contain Key       ${response.json()}      ID
    ${book_id}=    Get From Dictionary      ${response.json()}       ID
    log     ${book_id}
    Should Be Equal As Strings     successfully added     ${response.json()}[Msg]
    Status Should Be    200     ${response}
    Set Global Variable    ${book_id}
    
Get the Book Details which got added    
   ${get_response}=     GET    ${base_url}/Library/GetBook.php    params=ID=${book_id}   expected_status=200
   log    ${get_response.json()}
   Should Be Equal As Strings      ${book_name}       ${get_response.json()}[0][book_name]
   
Delete the Book from Database
   &{delete_req}=     Create Dictionary      ID=${book_id}
   ${delete_resp}=   POST    ${base_url}/Library/DeleteBook.php       json=${delete_req}   expected_status=200
   log  ${delete_resp.json()}
   Should Be Equal As Strings     book is successfully deleted        ${delete_resp.json()}[msg]