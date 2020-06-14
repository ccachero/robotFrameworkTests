*** Settings ***
Library     Collections
Resource    ../libraries/Common.robot
Resource    Entities_Common.robot

*** Test Cases ***  
User Should Be Able To Get Entities Summary
    [Tags]    Sanity    Smoke
    Given Hub is online
    ${json_entities_summary}=    When User Requests For Entities Summary
    Then Response Should be 200    ${json_entities_summary.status_code}
    And Entities summary should be returned    ${json_entities_summary}
    And Entities summary should be correct    ${json_entities_summary}

*** Keywords ***    
Entities summary should be returned
    [Arguments]      ${json_entities_summary}
    ${resp_json}=    Get JSON from Response    ${json_entities_summary}
    ${length}=       Get Length    ${resp_json}
    Run Keyword If   ${length} == 0  FAIL    Entities summary was not returned

Entities summary should be correct
    [Arguments]       ${json_entities_summary}
    Key Should Be Existing In Response Body    count    ${json_entities_summary}
    Key Should Be Existing In Response Body    attributes    ${json_entities_summary}
    Key Should Be Existing In Response Body    sampleEntities    ${json_entities_summary}
    Key Should Be Existing In Response Body    counts    ${json_entities_summary}
