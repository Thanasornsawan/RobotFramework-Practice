
*** Settings ***
Library     RequestsLibrary


*** Test Cases ***
TC-001 Verify when input wrong username or password, API should return error
    #call API with wrong username / password
    Create Session      loginSession             http://localhost:8082
    ${request_body}=    Create Dictionary   username=doppio222  password=12345
    ${resp}=    POST On Session     loginSession    /login      json=${request_body}    expected_status=401
    Should Be Equal     ${resp.json()['status']}    error
    Should Be Equal     ${resp.json()['message']}    invalid username or password

TC-002 Verify That Can Get Asset List From Get API correctly
    #call API to login and get token 
    Create Session      assetSession             http://localhost:8082
    ${request_body}=    Create Dictionary   username=doppio  password=weBuildBestQa
    ${resp}=    POST On Session     assetSession    /login      json=${request_body}    expected_status=200
    ${token}=   Set Variable    ${resp.json()['message']}
    ${headers}=     Create Dictionary       token=${token}
    #call Get API to get asset (with token) and verify status code is 200
    ${get_resp}=    GET On Session      assetSession    /assets         headers=${headers}
    #check response contains at least 1 assets
    ${count}=       Get Length  ${get_resp.json()}
    ${morethanone}=     Evaluate    ${count}>100
    Should Be True      ${morethanone}

TC-003 Verify that get asset API always require valid token
    #call asset API with invalid token or with no token 
    # check response code = 401 
    # check error message 


TC-004 Verify that create asset API can work correctly 
    #call create asset API (POST /assets) with valid token 
    # check response code = 200 
    # check status message = success
    # check that created asset can be returned from GET /assets


TC-005 Verify that cannot create asset with duplicated ID 
    #call create asset with valid token but use duplicate asset ID 
    # check status message 
    # check error message 
    # check that no duplicated asset returned from GET /assets

TC-006 Verify that modify asset API can work correctly 
    #call modify asset with valid token and try to change name of some asset 
    #check status message = success 
    #call get api to check that asset Name has been changed 

TC-007 Verify that delete asset API can work correctly
    #call delete asset 
    #call GET to check that asset has been deleted 


TC-008 Verify that cannot delete asset which ID does not exists 
    #call delete asset with non-existing id 
    #check error message 





