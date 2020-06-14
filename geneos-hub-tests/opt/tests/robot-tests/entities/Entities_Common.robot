*** Settings ***
Library    String
Library    OperatingSystem
Library    BuiltIn
Library    RequestsLibrary
Resource    ../libraries/Common.robot
Resource    ../resources/Resources.robot

*** Keywords ***
User Requests For Entities Summary
    User Gets Hub IP Address   
    ${resp}=    Get Request    hubAddress    ${entitiesSummary}
    [Return]    ${resp}

User Requests For Entities Attributes
    User Gets Hub IP Address   
    ${resp}=    Get Request    hubAddress    ${entitiesAttributes}
    [Return]    ${resp}    

Key Should Be Existing In Response Body
    [Arguments]     ${key}    ${json}
    ${resp_json}=   Get JSON from Response    ${json}
    ${match}=       Look for key in json    ${key}    ${resp_json}
    ${length}=      Get Length    ${match}
    Run Keyword If  ${length} == 0  FAIL      Expected key not found

Value Should Be Existing In Response Body
    [Arguments]     ${value}    ${json}
    ${match}=       Look For Value In Response    ${value}    ${json}
    ${length}=      Get Length    ${match}
    Run Keyword If  ${length} == 0  FAIL      Expected value in response not found
    
Look For Key In JSON 
    Comment    TODO: Transfer to common
    [Arguments]    ${key}     ${json}
    ${match}=    Evaluate    [d for d in ${json} if "${key}" in d]
    [Return]  ${match}

Look For Value In Response 
    [Arguments]    ${value}    ${json}
    ${match}=    Evaluate    [d for d in ${json} if "${value}" in d["name"]]
    [Return]   ${match}