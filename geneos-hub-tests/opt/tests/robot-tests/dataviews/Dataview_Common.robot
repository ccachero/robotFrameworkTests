*** Settings ***
Library    OperatingSystem
Library    BuiltIn
Library    RequestsLibrary
Library    Collections
Resource    ../libraries/Common.robot
Resource    ../resources/Resources.robot

*** Keywords ***
User Gets Dataview
    User Gets Hub IP Address   
    ${resp}=    Get Request    hubAddress    ${dataviewEndpoint}
    [Return]    ${resp}
    
User Gets Dataview Errors
    User Gets Hub IP Address
    ${resp}=    Get Request    hubAddress    ${dataviewErrorsEndpoint}
    [Return]    ${resp}
    
Dataview Path should contain
    [Arguments]    ${path}    ${path}
    ${respJson}=    Get JSON from Response    ${resp}
    ${match}=    Look for ${path} in Dataview ${respJson}
    
Dataview errors should be empty
    [Arguments]    ${resp}
    ${respJson}=    Get JSON from Response    ${resp}
    Should Not Be True    ${respJson}    Errors present
    
User Posts AC2 Query 
    [Arguments]    ${dataviewPath}    ${column}    ${row}
    User Gets Hub IP Address
    &{payload}=    Create Dictionary    from=0    to=99999999999999999
          ...    dataViewPath=${dataviewPath}
          ...    column=${column}    row=${row}    limit=5000
    ${resp}=    Post Request    hubAddress    ${ac2QueryEndpoint}    json=${payload}
    Response Should be 200 ${resp.status_code}
    Should Be True    ${resp}
    [Return]    ${resp}
    
Dataview Query should contain
    [Arguments]    ${resp}    ${filter}
    ${respJson}=    Get JSON from Response    ${resp}
    ${match}=    Look for ${filter} in AC2 Query ${respJson}
    
User Retrieves Dataview ID
    [Arguments]    ${resp}    ${filter}
    ${respJson}=    Get JSON from Response    ${resp}
    ${dataviewId}=    Get random Dataview ID    ${respJson}    ${filter}
    [Return]    ${dataviewId}
    
Get random Dataview ID
    [Arguments]    ${json}    ${filter}
    ${match}=    Evaluate    [d.get('dataviewId') for d in ${json} if "${filter}" in d["path"]]
    ${randomChoice}=    Evaluate    random.choice(${match})    modules=random
    [Return]   ${randomChoice}
    
User views Schema of Dataview
    [Arguments]    ${dataviewId}
    User Gets Hub IP Address
    ${resp}=    Get Request    hubAddress    ${dataviewEndpoint}/${dataviewId}
    [Return]    ${resp}
    