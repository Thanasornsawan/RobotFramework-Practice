*** settings ***
Library			SeleniumLibrary
Test Setup      Open Browser And Maximize
Test Teardown   Close Browser Window

*** Variables ***
${URL}        https://demoqa.com/checkbox
${Browser}          Chrome
${locator_home}     xpath:/html/body/div[2]/div/div/div[2]/div[2]/div[2]/div[1]/ol/li/span/label/span[1]
${toggle_button_home}  xpath://button[contains(@class,'rct-collapse rct-collapse-btn')]
${expand_element}   xpath://li[contains(@class,'rct-node rct-node-parent rct-node-expanded')][1]
${collapse_element}     xpath://li[contains(@class,'rct-node rct-node-parent rct-node-collapsed')][1]
${locate_workspace_list}    xpath://*[@id="tree-node"]/ol/li/ol/li[2]/ol/li[1]/ol/li
${toggle_button_documents}  xpath://*[@id="tree-node"]/ol/li/ol/li[2]/span/button
${toggle_button_workspace}  xpath://*[@id="tree-node"]/ol/li/ol/li[2]/ol/li[1]/span/button


*** Keywords ***
Open Browser And Maximize
    Open Browser  ${URL}  ${Browser}
    Maximize Browser Window
    Sleep  2s

Close Browser Window
    Close Browser
    Log To Console  Test Completed

** Test cases ***
tc-001 Verify page can expand and collapse at symbol >
    Page Should Contain Checkbox    id:tree-node-home
    Sleep       2s
    Click Element   ${locator_home}
    #expand home
    Sleep       2s
    Click Button    ${toggle_button_home}
    Sleep       2s
    #verify that page is expand
    Wait until page contains element  ${expand_element}
    #expand document
    Click Button    ${toggle_button_documents}
    Sleep       2s
    #scroll page to bottom
    execute javascript  window.scrollTo(0,document.body.scrollHeight)
    Sleep       2s
    #expand workspace
    Click Button    ${toggle_button_workspace}
    Sleep       2s
    #Get list of checkbox under 'WorkSpace'
    FOR    ${element}    IN RANGE   1   4
           ${str}=     Catenate    SEPARATOR=  ${locate_workspace_list}  [${element}]  /span/label/span[3]
           ${text}=    Get Text    ${str} 
           Log to Console  ${text}
    END
    Sleep       2s
    #collapse home
    Click Button    ${toggle_button_home}
    Sleep       2s
    #verify that page is collapse
    Wait until page contains element    ${collapse_element}
