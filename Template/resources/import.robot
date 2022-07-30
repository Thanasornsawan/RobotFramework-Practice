*** Settings ***
Library        SeleniumLibrary
Variables      ${CURDIR}/settings/mobile/android/setting.yaml
Variables      ${CURDIR}/testdata/mobile/android/test_data.yaml
Variables      ${CURDIR}/translation/${LANG}.yaml

# Locator
Resource       ${CURDIR}/../keywords/mobile/locators/...robot

# Page
Resource       ${CURDIR}/../keywords/mobile/pages/...robot

# feature
Resource       ${CURDIR}/../keywords/mobile/features/...robot