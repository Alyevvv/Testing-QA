*** Settings ***
Library           SeleniumLibrary

*** variables ***
${BROWSER}     headlesschrome
${HOST}    https://tple010store.000webhostapp.com/ATK%20TPLE010%20STORE/ATK%20TPLE010/login.php

${EMAIL}    Kalebise@gmail.com
${PASS-1}    123456    # correct password
${PASS-2}    xxs12s2    # wrong password
 

*** Test Cases ***

# login
# positive test
testcase-1
    Login Success
    Close Browser    

# negative test
testcase-2
    Open Browser    ${HOST}    ${BROWSER}
    input text      id:email    ${EMAIL}
    input text      id:password ${PASS-2}
    submit form
 

# logout
testcase-3
    Login Success
    click Element    id:navbarDropdown
    click Element    xpath://a[@href='logout.php']
    Close Browser 

*** Keywords ***

Login Success
    Open Browser    ${HOST}    ${BROWSER}
    input text      id:email    ${EMAIL}
    input text      id:password ${PASS-1}
    submit form
