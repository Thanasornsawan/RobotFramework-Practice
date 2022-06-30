*** settings ***
Resource            ../keywords/keywords.robot
Variables            ../keywords/variables.yaml
Test Setup          keywords.Setup asset session

*** Test cases ***
TC-001 Verify that when input wrong username or password, API should return error
    ${login_response}=                keywords.Login asset with invalid credential                ${unauthorized_status}
    keywords.Verify the response of login request failed                ${login_response}

TC-002 Verify that can Get Asset List From Get API correctly
    ${login_response}=        keywords.Login asset with valid credential              ${authorized_status}
    ${headers}=             keywords.Verify the response of login request success               ${login_response}
    ${get_response}=                keywords.Send GET request for receive assets              ${headers}              ${authorized_status}
    keywords.Verify the response contains at least 1 asset              ${get_response}

TC-003 Verify that get asset API always require valid token
    ${response}=                keywords.Send GET request for receive assets             ${invalid_headers}           ${unauthorized_status}
    keywords.Verify user don't have authorization to access API data             ${response}

TC-004 Verify that create asset API can work correctly
    ${login_response}=        keywords.Login asset with valid credential              ${authorized_status}
    ${headers}=             keywords.Verify the response of login request success               ${login_response}
    ${response}     ${assetId}=               keywords.Send POST request for create assets                ${headers}              ${authorized_status}
    ${get_resp}=                keywords.Send GET request for receive assets                ${headers}                ${authorized_status}
    keywords.Verify status code is success                  ${response}
    keywords.Verify asset is created                ${get_resp.json()}                ${assetId}
    keywords.Verify the data was created correctly all parameters             ${get_resp}

TC-005 Verify that cannot create asset with duplicated ID
    ${login_response}=        keywords.Login asset with valid credential              ${authorized_status}
    ${headers}=             keywords.Verify the response of login request success               ${login_response}
    ${response}     ${assetId}=                keywords.Send POST request for create assets                ${headers}              ${authorized_status}
    ${get_resp}=                keywords.Send GET request for receive assets                ${headers}                ${authorized_status}
    keywords.Verify user unable to create duplicate assetId                 ${response}             ${assetId}
    keywords.Verify that no dupplicate assetId in GET response              ${get_resp}             ${assetId}

TC-006 Verify that modify asset API can work correctly
    ${login_response}=              keywords.Login asset with valid credential              ${authorized_status}
    ${headers}=             keywords.Verify the response of login request success               ${login_response}
    ${response}     ${assetId}=                keywords.Send PUT request to modify asset               ${headers}
    ${get_resp}=                keywords.Send GET request for receive assets                ${headers}                ${authorized_status}
    keywords.Verify status code is success                  ${response}
    keywords.Verify the assetName of this assetId was changed               ${get_resp}             ${assetId}

TC-007 Verify that delete asset API can work correctly
    ${login_response}=        keywords.Login asset with valid credential              ${authorized_status}
    ${headers}=             keywords.Verify the response of login request success               ${login_response}
    ${del_response}=                keywords.Send DELETE request for remove specific assetID                ${data.assetId}             ${headers}
    ${get_resp}=                keywords.Send GET request for receive assets                ${headers}                ${authorized_status}
    keywords.Verify the assetId has been deleted                ${del_response}             ${get_resp}             ${data.assetId}