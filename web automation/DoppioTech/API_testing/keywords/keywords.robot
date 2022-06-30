*** settings ***
Library              RequestsLibrary
Library              JSONLibrary
Library              String
Variables            variables.yaml

*** Keywords ***
Setup asset session
	RequestsLibrary.Create Session          ${session_name}              ${HOST}

#Method load login.json
Login asset with invalid credential
    [Arguments]             ${status_code}
    ${request}=             JSONLibrary.Load json from file             ${CURDIR}/resources/login.json
    ${request}=             JSONLibrary.Update value to json            ${request}              $..username             ${invalid_cred.username}
    ${request}=             JSONLibrary.Update value to json            ${request}              $..password             ${invalid_cred.password}
    ${response}=            RequestsLibrary.Post on session             ${session_name}             ${login_path}               json=${request}                expected_status=${status_code}
    [Return]                ${response}

Login asset with valid credential
    [Arguments]             ${status_code}
    ${request}=             JSONLibrary.Load json from file             ${CURDIR}/resources/login.json
    ${response}=            RequestsLibrary.Post on session             ${session_name}             ${login_path}               json=${request}                expected_status=${status_code}
    [Return]                ${response}

Set token header
    [Arguments]             ${token}
    ${headers}=             Create dictionary               token=${token}
    [Return]                ${headers}

Send GET request for receive assets
    [Arguments]             ${headers}              ${status_code}
    ${get_resp}=            RequestsLibrary.Get on session              ${session_name}             ${asset_path}               headers=${headers}              expected_status=${status_code}
    [Return]                ${get_resp}

Send POST request for create assets
    [Arguments]             ${headers}              ${status_code}
    ${request}=             JSONLibrary.Load json from file             ${CURDIR}/resources/create_asset.json
    ${assetId}=	            JSONLibrary.Get value from json             ${request}              $..assetId
    ${response}=            RequestsLibrary.Post on session             ${session_name}             ${asset_path}               headers=${headers}              json=${request}             expected_status=${status_code}
    [Return]                ${response}     @{assetId}

Send DELETE request for remove specific assetID
    [Arguments]             ${assetID}                  ${headers}
    ${response}=            RequestsLibrary.Delete on session           ${session_name}        ${asset_path}/${assetID}             headers=${headers}              expected_status=any
    [Return]                ${response}

Send PUT request to modify asset
    [Arguments]             ${headers}
    ${request}=             JSONLibrary.Load json from file             ${CURDIR}/resources/create_asset.json
    ${request}=             JSONLibrary.Update value to json            ${request}              $..assetName             ${data.assetName}
    ${assetId}=	            JSONLibrary.Get value from json             ${request}              $..assetId
    ${response}=            RequestsLibrary.Put on session              ${session_name}        ${asset_path}      headers=${headers}                json=${request}
    [Return]                ${response}     @{assetId}

Verify the response contains at least 1 asset
    [Arguments]             ${response}
    ${count}=               Get length              ${response.json()}
    ${morethanone}=             Evaluate                ${count} > 0
    Should be true          ${morethanone}

Verify the response of login request success
    [Arguments]                 ${response}
    Should Be Equal             ${response.json()['status']}                     ${success}
    ${token}=                   Set token header                ${response.json()['message']}
    [Return]                    ${token}

Verify the response of login request failed
    [Arguments]                 ${response}
    Verify status code is error             ${response}
    Should be equal             ${response.json()['message']}                ${login_error}

Verify user don't have authorization to access API data
    [Arguments]             ${response}
    Verify status code is error             ${response}
    Should be equal         ${response.json()['message']}               ${token_error}

Verify user unable to create duplicate assetId
    [Arguments]             ${response}             ${assetId}
    Verify status code is failed                ${response}
    ${dupplicate_id_error}=             String.Replace string              ${dupplicate_id_error}               assetId         ${assetId}
    Should be equal         ${response.json()['message']}               ${dupplicate_id_error}

Verify the API data not found this assetId in database
    [Arguments]             ${response}
    Verify status code is failed            ${response}
    Should be equal             ${response.json()['message']}               ${id_not_found_error}

Verify asset is created
    [Arguments]             ${response}            ${expected_assetId}
    ${status}=              Run keyword and return status         JSONLibrary.Get value from json            ${response}                $[?(@.assetId==${expected_asset_id})]
    Should be true              ${status}

Verify the data was created correctly all parameters
    [Arguments]             ${response}
    ${length}=               Get length              ${response.json()}
    ${last}=                 Evaluate                ${length}-1
    ${asset_json}=             JSONLibrary.Load json from file             ${CURDIR}/resources/create_asset.json
    ${assetId}=	            JSONLibrary.Get value from json             ${asset_json}              $..assetId
    ${assetName}=           JSONLibrary.Get value from json             ${asset_json}              $..assetName
    ${assetType}=           JSONLibrary.Get value from json             ${asset_json}              $..assetType
    ${inUse}=               JSONLibrary.Get value from json             ${asset_json}              $..inUse
    Should be equal                 ${response.json()}[${last}][assetId]             @{assetId}
    Should be equal                 ${response.json()}[${last}][assetName]           @{assetName}
    Should be equal as strings      ${response.json()}[${last}][assetType]           @{assetType}
    ${inUse}=                       Convert to boolean            @{inUse}
    Should be equal                 ${response.json()}[${last}][inUse]               ${inUse}

Verify status code is success
    [Arguments]             ${response}
    Should be equal         ${response.json()['status']}               ${success}

Verify status code is failed
    [Arguments]             ${response}
    Should be equal         ${response.json()['status']}                ${failed}

Verify status code is error
    [Arguments]             ${response}
    Should be equal         ${response.json()['status']}                ${error}

Verify that no dupplicate assetId in GET response
    [Arguments]             ${response}                 ${assetId}
    ${json}=                Set variable                ${response.json()}
    ${index}=               Set variable                0
    FOR    ${member}     IN      @{json}
            IF    "${member}[assetId]" == "${assetId}"
                    ${index}=          Evaluate       int(${index}) + 1
            END
    END
    #Verify found this assetID only 1 time
    IF  ${index}!= 0
        Should be equal as integers         ${index}                1
    ELSE
        Log      This assetId: ${assetId} not found
    END

Verify the assetName of this assetId was changed
    [Arguments]             ${response}     ${assetId}
    ${json}=                Set variable                ${response.json()}
    ${index}=               Set variable                0
    FOR    ${member}     IN      @{json}
            IF    "${member}[assetId]" == "${assetId}"
                   Should be equal         ${member}[assetName]           ${data.assetName}
            END
    END

Verify the assetId has been deleted
    [Arguments]             ${del_response}         ${get_response}         ${assetId}
    IF          "${del_response.json()['status']}" == "${failed}"
        Verify the API data not found this assetId in database              ${del_response}
    ELSE IF     "${del_response.json()['status']}" == "${success}"
        Verify that no dupplicate assetId in GET response               ${get_response}             ${assetId}
    END