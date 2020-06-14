*** Settings ***
Resource    Entities_Common.robot
Resource    ../libraries/Common.robot

*** Test Cases ***  
User Should Be Able To Get All Entity Attributes
    [Tags]    Smoke
    Given Hub is online
    ${entities_attributes}=    When User Requests For Entities Summary
    Then Entities attributes should be returned    ${entities_attributes}

User Should Be Able To Get Default Entity Attributes
    [Tags]    Smoke    Sanity
    Given Hub is online
    ${entities_attributes}=    When User Requests For Entities Attributes
    Then Default Entity Attributes Should Be Returned    ${entities_attributes}

*** Keywords ***  
Entities attributes should be returned
    [Arguments]      ${entities_attributes}
    ${resp_json}=    Get JSON from Response    ${entities_attributes}
    ${length}=       Get Length    ${resp_json}
    Run Keyword If   ${length} == 0  FAIL    Entities attributes were not returned
    
Default Entity Attributes Should Be Returned
    [Arguments]      ${entities_attributes}
    ${json}=    Get JSON from Response    ${entities_attributes}
    Value Should Be Existing In Response Body    itrs.host-name    ${json}
    Value Should Be Existing In Response Body    itrs.legacy-path  ${json}
    Value Should Be Existing In Response Body    itrs.name         ${json}
    Value Should Be Existing In Response Body    itrs.os           ${json}
    Value Should Be Existing In Response Body    itrs.os-type      ${json}
