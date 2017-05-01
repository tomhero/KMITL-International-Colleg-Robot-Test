*** Settings ***
Library           Selenium2Library
Test Setup        Start browser
Test Teardown     Close All Browsers

*** Keywords ***
Start browser
    Open Browser    http://www.ic.kmitl.ac.th/
    Maximize Browser Window
    Skip Start Page
Skip Start Page
    Click Element    xpath=//img[contains(@src, 'images/r10.jpg')]
    Wait Until Element Is Visible    xpath=//span[text()='People']
Open Moodle
    Click Button    Student Links
    Wait Until Element Is Visible    xpath=//a[contains(@href, '/moodle/')]
    Click Link    xpath=//a[contains(@href, '/moodle/')]

*** Test Cases ***
ทดสอบหน้ารายชื่ออาจารย์
    Mouse Over    xpath=//*[text()='People']
    Wait Until Element Is Visible    xpath=//span[text()='Academic Staff']
    Click Element    xpath=//span[text()='Academic Staff']
    Wait Until Element Is Visible    xpath=//div[@class='team-photo']
    Page Should Contain    Assoc.Prof.Dr. Supat Kittiratsatcha

ทดสอบหน้ารายชื่อเจ้าหน้าที่
    Mouse Over    xpath=//*[text()='People']
    Wait Until Element Is Visible    xpath=//span[text()='Administrative Staff']
    Click Element    xpath=//span[text()='Administrative Staff']
    Wait Until Element Is Visible    xpath=//div[@class='team-photo']
    Page Should Contain    Orathai Phumyoi

ทดสอบล็อคอิน Moodle ด้วย Username Password
    Open Moodle
    Wait Until Element Is Visible    xpath=//span[@class='login']
    Click Element    xpath=//a[text()='Log in']
    Wait Until Element Is Visible    id=username
    Input Text    username    guest
    Input Password    password    guest
    Click Button    Log in
    Wait Until Element Is Visible    xpath=//a[text()='Log in']
    Element Should Contain    xpath=//span[@class='login']    You are currently using guest access

ทดสอบล็อคอิน Moodle ด้วย Guest
    Open Moodle
    Wait Until Element Is Visible    xpath=//span[@class='login']
    Click Element    xpath=//a[text()='Log in']
    Wait Until Element Is Visible    id=username
    Input Text    username    guest
    Input Password    password    guest
    Click Button    Log in
    Wait Until Element Is Visible    xpath=//a[text()='Log in']
    Element Should Contain    xpath=//span[@class='login']    You are currently using guest access


