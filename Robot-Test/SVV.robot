*** Settings ***
Library           Selenium2Library
Library           AllureReportLibrary

*** Variables ***
${HOMEPAGE}        http://www.ic.kmitl.ac.th/
${BROWSER}         chrome
${THREESECOND}     3.0
${FIVESECOND}      5.0
${TENSECOND}       10.0

*** Keywords ***
Start Browser
    Open Browser    ${HOMEPAGE}    ${BROWSER}
    Maximize Browser Window
    Skip Start Page
Skip Start Page
    Click Element    xpath=//img[contains(@src, 'images/r10.jpg')]
    Wait Until Element Is Visible    xpath=//span[text()='People']
Open Moodle
    Click Button    Student Links
    Wait Until Element Is Visible    xpath=//a[contains(@href, '/moodle/')]
    Click Link    xpath=//a[contains(@href, '/moodle/')]
Restart Test
    Go To    http://www.ic.kmitl.ac.th/index.php
    Wait Until Page Contains    More Info
    Page Should Contain    International College
    Page Should Contain    King Mongkut's Institute of Technology Ladkrabang


*** Test Cases ***
ทดสอบหน้ารายชื่ออาจารย์
    Start Browser
    Mouse Over    xpath=//*[text()='People']
    Wait Until Element Is Visible    xpath=//span[text()='Academic Staff']
    Click Element    xpath=//span[text()='Academic Staff']
    Wait Until Element Is Visible    xpath=//div[@class='team-photo']
    Page Should Contain    Assoc.Prof.Dr. Supat Kittiratsatcha

ทดสอบหน้ารายชื่อเจ้าหน้าที่
    Restart Test
    Mouse Over    xpath=//*[text()='People']
    Wait Until Element Is Visible    xpath=//span[text()='Administrative Staff']
    Click Element    xpath=//span[text()='Administrative Staff']
    Wait Until Element Is Visible    xpath=//div[@class='team-photo']
    Page Should Contain    Orathai Phumyoi

ทดสอบล็อคอิน Moodle ด้วย Username Password
    Restart Test
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
    Restart Test
    Open Moodle
    Wait Until Element Is Visible    xpath=//span[@class='login']
    Click Element    xpath=//a[text()='Log in']
    Wait Until Element Is Visible    id=username
    Input Text    username    guest
    Input Password    password    guest
    Click Button    Log in
    Wait Until Element Is Visible    xpath=//a[text()='Log in']
    Element Should Contain    xpath=//span[@class='login']    You are currently using guest access

ทดสอบปุ่ม More Info หน้าแรกปุ่มแรก
    Restart Test
    Wait Until Page Contains    More Info
    Click Element    dom=document.getElementsByTagName('li')[42]
    Sleep    ${THREESECOND}
    Click Link    dom=document.links[49]
    Wait Until Page Contains    SOFTWARE ENGINEERING    ${FIVESECOND}
    Page Should Not Contain    not found

ทดสอบปุ่ม More Info หน้าแรกปุ่มสอง
    Restart Test
    Wait Until Page Contains    More Info
    Click Element    dom=document.getElementsByTagName('li')[43]
    Sleep    ${THREESECOND}
    Click Link    dom=document.links[50]
    Wait Until Page Contains    LOGISTICS AND SUPPLY CHAIN MANAGEMENT    ${FIVESECOND}
    Page Should Not Contain    not found

ทดสอบปุ่ม More Info หน้าแรกปุ่มสาม
    Restart Test
    Wait Until Page Contains    More Info
    Click Element    dom=document.getElementsByTagName('li')[44]
    Sleep    ${THREESECOND}
    Click Link    dom=document.links[51]
    Wait Until Page Contains    ENGINEERING AND TECHNOLOGY MANAGEMENT    ${FIVESECOND}
    Page Should Not Contain    not found

ทดสอบปุ่ม More Info หน้าแรกปุ่มสี่
    Restart Test
    Wait Until Page Contains    More Info
    Click Element    dom=document.getElementsByTagName('li')[45]
    Sleep    ${THREESECOND}
    Click Link    dom=document.links[52]
    Wait Until Page Contains    AUTOMOTIVE ENGINEERING    ${FIVESECOND}
    Page Should Not Contain    not found

ทดสอบปุ่ม More Info หน้าแรกปุ่มห้า
    Restart Test
    Wait Until Page Contains    More Info
    Click Element    dom=document.getElementsByTagName('li')[46]
    Sleep    ${THREESECOND}
    Click Link    dom=document.links[53]
    Wait Until Page Contains    COMPUTING IN ENGINEERING SYSTEMS    ${FIVESECOND}
    Page Should Not Contain    not found

ทดสอบเข้าหน้า apply ของหลักสูตร SOFTWARE ENGINEERING
    Restart Test
    Wait Until Page Contains    More Info
    Mouse Over    xpath=//*[text()='Programs']
    Wait Until Element Is Visible    xpath=//span[text()='Software Engineering']
    Click Element    xpath=//span[text()='Software Engineering']
    Wait Until Page Contains    Software Engineering
    Click Link    xpath=//*[@id="tab"]/li[4]/a
    Sleep    ${THREESECOND}
    Mouse Over    xpath=//*[@id="tab-admission"]/p[7]/a
    Mouse Down    xpath=//*[@id="tab-admission"]/p[7]/a
    Mouse Up    xpath=//*[@id="tab-admission"]/p[7]/a
    Select Window    url=http://www.ic.kmitl.ac.th/apply/
    Wait Until Page Contains    Online Application
    [Teardown]    Close Browser