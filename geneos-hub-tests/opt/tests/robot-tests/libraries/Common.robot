*** Settings ***
Library    OperatingSystem
Library    BuiltIn
Library    RequestsLibrary
Resource    ../resources/Resources.robot

*** Keywords ***
Hub is Online
    User Gets Hub IP Address
    ${resp}=    Get Request    hubAddress    ${pingEndpoint}
    
User Gets Hub IP Address
    Create Session    hubAddress    ${hubAddress}    disable_warnings=1
    
Response Should be 200 
    [Arguments]      ${status_code}
    Should Be Equal As Strings    ${status_code}    200
    
Get JSON from Response
    [Arguments]    ${resp}
    ${respJson}=    To Json    ${resp.content}    pretty_print=True
    [Return]    ${respJson}
    
Look for ${filter} in Dataview ${json}
    ${match}=    Evaluate    [d for d in ${json} if "${filter}" in d["path"]]
    [Return]   ${match}
    
Look for ${filter} in AC2 Query ${json}
    ${match}=    Evaluate    [d for d in ${json} if ${filter} == d["value"]]
    [Return]   ${match}