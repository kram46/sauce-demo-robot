*** Settings ***
Documentation   A test suite with a single test for valid login

Library     SeleniumLibrary
*** Test Cases ***
Valid Login
    # open browser
    Open Browser  https://www.saucedemo.com/    chrome
    # set window size
    Maximize Browser Window
    Set Selenium Speed  0
    # check if in login page
    Page Should Contain Element  login-button
    # input usernameInput 
    Input Text  user-name  standard_user
    # input passwordInput
    Input Password  password  secret_sauce
    # click login button
    Click Button  login-button
    # should be open in products page
    Element Text Should Be  class:title     PRODUCTS
    # close browser
    [Teardown]  Close Browser

Locked Out Login
    # open browser
    Open Browser  https://www.saucedemo.com/    chrome
    # set window size
    Maximize Browser Window
    Set Selenium Speed  0
    # check if in login page
    Page Should Contain Element  login-button
    # input usernameInput 
    Input Text  user-name  locked_out_user
    # input passwordInput
    Input Password  password  secret_sauce
    # click login button
    Click Button  login-button
    # Error message is "Epic sadface: Sorry, this user has been locked out."
    Element Text Should Be  xpath://*[@id="login_button_container"]/div/form/div[3]/h3    Epic sadface: Sorry, this user has been locked out.
    # close browser
    [Teardown]  Close Browser

Wrong Password
    # open browser
    Open Browser  https://www.saucedemo.com/    chrome
    # set window size
    Maximize Browser Window
    Set Selenium Speed  0
    # check if in login page
    Page Should Contain Element  login-button
    # input usernameInput 
    Input Text  user-name  locked_out_user
    # input passwordInput
    Input Password  password  wrongpass
    # click login button
    Click Button  login-button
    # Error message is "Epic sadface: Username and password do not match any user in this service"
    Element Text Should Be  xpath://*[@id="login_button_container"]/div/form/div[3]/h3    Epic sadface: Username and password do not match any user in this service
    # close browser
    [Teardown]  Close Browser

Broken Inventory Page
    # open browser
    Open Browser  https://www.saucedemo.com/    chrome
    # set window size
    Maximize Browser Window
    Set Selenium Speed  0
    # check if in login page
    Page Should Contain Element  login-button
    # input usernameInput 
    Input Text  user-name  problem_user
    # input passwordInput
    Input Password  password  secret_sauce
    # click login button
    Click Button  login-button
    # should be open in products page
    Element Text Should Be  class:title     PRODUCTS
    # Wrong image
    Element Attribute Value Should Be   xpath://*[@id="item_0_img_link"]/img     src     https://www.saucedemo.com/static/media/sl-404.168b1cce.jpg
    # close browser
    [Teardown]  Close Browser

Sort A to Z

        # open browser
    Open Browser  https://www.saucedemo.com/    chrome
    # set window size
    Maximize Browser Window
    Set Selenium Speed  0
    # check if in login page
    Page Should Contain Element  login-button
    # input usernameInput 
    Input Text  user-name  standard_user
    # input passwordInput
    Input Password  password  secret_sauce
    # click login button
    Click Button  login-button
    # should be open in products page
    Element Text Should Be  class:title     PRODUCTS
    # Sort A to Z
    Select From List By Value  class:product_sort_container   az
     List Selection Should Be   class:product_sort_container  Name (A to Z)
    # close browser
    [Teardown]  Close Browser

Sort Z to A

        # open browser
    Open Browser  https://www.saucedemo.com/    chrome
    # set window size
    Maximize Browser Window
    Set Selenium Speed  0
    # check if in login page
    Page Should Contain Element  login-button
    # input usernameInput 
    Input Text  user-name  standard_user
    # input passwordInput
    Input Password  password  secret_sauce
    # click login button
    Click Button  login-button
    # should be open in products page
    Element Text Should Be  class:title     PRODUCTS
    # Sort A to Z
    Select From List By Value  class:product_sort_container   za
    List Selection Should Be   class:product_sort_container     Name (Z to A)
    # close browser
    [Teardown]  Close Browser

Sort Low to High

        # open browser
    Open Browser  https://www.saucedemo.com/    chrome
    # set window size
    Maximize Browser Window
    Set Selenium Speed  0
    # check if in login page
    Page Should Contain Element  login-button
    # input usernameInput 
    Input Text  user-name  standard_user
    # input passwordInput
    Input Password  password  secret_sauce
    # click login button
    Click Button  login-button
    # should be open in products page
    Element Text Should Be  class:title     PRODUCTS
    # Sort A to Z
    Select From List By Value  class:product_sort_container   lohi
    List Selection Should Be   class:product_sort_container     Price (low to high)
    # close browser
    [Teardown]  Close Browser


Sort High to Low

        # open browser
    Open Browser  https://www.saucedemo.com/    chrome
    # set window size
    Maximize Browser Window
    Set Selenium Speed  0
    # check if in login page
    Page Should Contain Element  login-button
    # input usernameInput 
    Input Text  user-name  standard_user
    # input passwordInput
    Input Password  password  secret_sauce
    # click login button
    Click Button  login-button
    # should be open in products page
    Element Text Should Be  class:title     PRODUCTS
    # Sort A to Z
    Select From List By Value  class:product_sort_container   hilo
    List Selection Should Be   class:product_sort_container     Price (high to low)
    # close browser
    [Teardown]  Close Browser