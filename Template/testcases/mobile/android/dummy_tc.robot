*** Settings ***
Resource         ${CURDIR}/../../../resources/imports.robot
Test Setup       common.Open application
Test Teardown    common.Close application

*** Test Cases ***