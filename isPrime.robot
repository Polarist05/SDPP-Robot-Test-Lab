*** Settings ***
Library    SeleniumLibrary
Library     RequestsLibrary

*** Keywords ***
Is Prime
    [Arguments]    ${num}    
    ${response}=        Get         http://localhost:3000/is_prime/${num}    expected_status=any
    RETURN        ${response}

*** Test Cases ***
True When X is 17
    ${response}=     Is Prime     17
    Status Should Be     200
    ${result}=    Set Variable    ${response.json()['result']}
    Should Be True    ${result}

False When X is 36
    ${response}=     Is Prime     36
    Status Should Be     200
    ${result}=    Set Variable    ${response.json()['result']}
   Run Keyword If    ${result}    ${FALSE}

True When X is 13219
    ${response}=     Is Prime     13219
    Status Should Be     200
    ${result}=    Set Variable    ${response.json()['result']}
    Should Be True    ${result}