*** settings ***
Library			        SeleniumLibrary
Library                 String
Library                 yaml
Library                 OperatingSystem
Library                 Collections
Resource                ${CURDIR}/../pages/home.robot
Resource                ${CURDIR}/../pages/computer.robot
Resource                ${CURDIR}/../pages/search_with_alphabet.robot
Resource                ${CURDIR}/../features/home_feature.robot
Resource                ${CURDIR}/../features/computer_products_feature.robot
Resource                ${CURDIR}/../features/search_brand_feature.robot
Resource                common.robot
Variables               config.yaml