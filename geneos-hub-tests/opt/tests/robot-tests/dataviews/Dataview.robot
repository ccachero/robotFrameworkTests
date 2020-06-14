*** Settings ***
Resource    Dataview_Common.robot

*** Test Case ***
User should be able to Get list of Dataviews Published
    [Tags]    Smoke
    Given Hub is Online
    ${resp}=    When User Gets Dataview
    Then Response Should be 200    ${resp.status_code}
    
User should be able to Get schema of a Dataview
    [Tags]    Smoke
    Given Hub is Online
    ${resp}=    When User Gets Dataview
    ${dataviewId}=    And User Retrieves Dataview ID    ${resp}     CPU
    ${schemaResp}=    And User views Schema of Dataview     ${dataviewId}
    Then Response Should be 200    ${schemaResp.status_code}
    
User should not receive any dataview errors
    [Tags]    Smoke
    Given Hub is Online
    ${resp}=    When User Gets Dataview Errors
    Then Dataview errors should be empty    ${resp}
    