*** settings ***
Documentation               Basic login testing
Resource                ../keywords/utils/import.robot

Test Setup              common.Open browser and maximize
Test Teardown               common.Close browser window

*** Variables ***
${valid_username}     Admin Banga
${valid_password}     Password@1234
${invalid_username}     abcd@doppiotech.com
${invalid_password}     1234

*** Test cases ***
TC001- Verify that when login with correct username and password , system can login success
    login_feature.Input username ,password and click sign in button             ${valid_username}               ${valid_password}
    home.Page should contain username in the formation bar               ${valid_username}

TC002- Verify that when login with wrong username / password , system can show proper error
    login_feature.Input username ,password and click sign in button             ${invalid_username}               ${invalid_password}
    home.Page should not contain username in the formation bar               ${invalid_username}

TC003- verify that username is required field
    login_feature.Input username ,password and click sign in button             ${EMPTY}               ${valid_password}
    login.Page should show error at the required field

TC004- verify that password is required field
    login_feature.Input username ,password and click sign in button             ${invalid_username}               ${EMPTY}
    login.Page should show error at the required field