*** Keywords ***
Open browser and maximize
    SeleniumLibrary.Open browser                ${url}              ${browser}
    SeleniumLibrary.Maximize browser window

Close browser window
    SeleniumLibrary.Close browser
    Log to console                              Test Completed

Read data from file
    [Arguments]                  ${path}
    ${status}=              BuiltIn.Run keyword and return status           OperatingSystem.File should exist                ${path}
    IF      '${status}'=='True'
            ${data_file}=                OperatingSystem.Get file            ${path}
            ${data}=                     yaml.Safe load                      ${data_file}
    ELSE
        Log to console                   Not found file at ${path}
    END
    [Return]                     ${data}

Record data into new file
    [Arguments]             ${data}
    ${output}=              yaml.Dump               ${data}
    ${status}=              BuiltIn.Run keyword and return status         OperatingSystem.File should not exist             ${new_data_path}
    IF      ${status} =='False'
            OperatingSystem.Remove file             ${new_data_path}
            OperatingSystem.Wait until removed      ${new_data_path}
            OperatingSystem.Create file             ${new_data_path}        ${output}
    ELSE
            OperatingSystem.Create file             ${new_data_path}        ${output}
    END

Get dictionary from file
    [Arguments]             ${path}             ${keyword}
    ${data}=                Read data from file                         ${path}
    ${dict}=                Collections.Copy dictionary                 ${data}[${keyword}]
    ${key}=                 Collections.Get dictionary keys             ${dict}                     sort_keys=False
    [Return]                ${dict}             ${key}

Get list from file
    [Arguments]             ${path}             ${keyword}
    ${data}=                Read data from file                             ${path}
    @{list}=                Collections.Copy list                           ${data}[${keyword}]
    [Return]                ${list}