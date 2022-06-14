*** settings ***
Library			RequestsLibrary

*** Variables ***


*** Test cases ***
TC-001 Verify that when input wrong username or password, API should return error
    #call API with wrong username / password
    Create Session  loginSession        http://localhost:8082
    ${request_body}=    Create Dictionary   username=doppio222   password=12345
	${resp}=        Post On Session      loginSession       /login      json=${request_body}    expected_status=401
    Should Be Equal     ${resp.json()['status']}        error
    Should Be Equal     ${resp.json()['message']}       invalid username or password

TC-002 Verify that can Get Asset List From Get API correctly
    #call API to login and get token
    Create Session  assetSession        http://localhost:8082
    ${request_body}=    Create Dictionary   username=doppio   password=weBuildBestQa
    ${resp}=        Post On Session      assetSession       /login      json=${request_body}    expected_status=200
    ${token}=       Set Variable    ${resp.json()['message']}
    ${headers}=     Create Dictionary       token=${token}
    Set Global Variable     ${headers}

    #call Get API to get asset (with token) and verify status code is 200
    ${get_resp}=    Get On Session      assetSession    /assets     headers=${headers}
    Log To Console  ${get_resp}

    #check response contains at least 1 assets
    ${count}=       Get Length      ${get_resp.json()}
    ${morethanone}=     Evaluate    ${count}>0
    Should Be True      ${morethanone}

TC-003 Verify that get asset API always require valid token
    #call asset API with invalid token or with no token 
    ${newheaders}=     Create Dictionary       token=123
    ${get_resp}=    Get On Session      assetSession    /assets     headers=${newheaders}      expected_status=401
    Should Be Equal     ${get_resp.json()['status']}        error
    Should Be Equal     ${get_resp.json()['message']}       you do not have access to this resource

TC-004 Verify that create asset API can work correctly 
    #call create asset API (POST /assets) with valid token 
    # check response code = 200 
    # check that created asset can be returned from GET /assets
    ${request_body}=    Create Dictionary   assetId=a99c   assetName=Macpro m1   assetType=1    inUse=true
    ${resp}=        Post On Session      assetSession       /assets     headers=${headers}      json=${request_body}    expected_status=200
    ${get_resp}=    Get On Session      assetSession    /assets     headers=${headers}
    ${count}=       Get Length      ${get_resp.json()}
    ${morethanone}=     Evaluate    ${count}>0
    Should Be True      ${morethanone}
    ${last}=        Evaluate        ${count}-1
    Should Be Equal     ${get_resp.json()}[${last}][assetId]       a99c
    Should Be Equal     ${get_resp.json()}[${last}][assetName]     Macpro m1
    Should Be Equal As Strings     ${get_resp.json()}[${last}][assetType]     1
    Should Be True      ${get_resp.json()}[${last}][inUse]         
