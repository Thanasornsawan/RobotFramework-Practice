## Robot Framework Selenium Practice

This repository is my robot framework practice

### Version of package in this repository
robotframework                 |	5.0.1 <br/>
robotframework-pythonlibcore   |	3.0.0 <br/>
robotframework-requests        |	0.9.3 <br/>
robotframework-seleniumlibrary |	6.0.0 <br/>
selenium                       |	4.2.0 <br/>

**Please check your version and document during following this repository because some old robot framework version use another way to define variables**

### How to start robot
```shell
robot {filename.robot}
normal command: robot broke.robot
run specific test case in test suite: robot -t "tc-001*" .\broke.robot
keep the result inside folder Results: robot -d .\Results\ '.\web automation\eBay\basicSearch.robot' 
Specify variable: robot -d .\Results\ -v env:uat '.\web automation\eBay\basicSearch.robot' 
```

### Web automation
> require `pip install robotframework` and `pip install robotframework-seleniumlibrary` <br/>
> Download chrome driver and set into PATH system.<br/>

#### Doppio Tech
> File for test web automation is in folder `ep01_material` for test on localhost <br/>
> Focus on practice many techniques for xpath input text box and form.

- ex00 focus on input text that have unique ID
- ex01 focus on input text that have custom attribute 'v'
- ex02 focus on parent tag <div> have custom attribute 'v'
- ex03 focus on parent tag <div> have custom attribute 'v' + random value
- ex04 both parent 'div tag' and child 'input tag' not have attribute but <span> have custom attribute 'c'
- ex05 None of tags has attruibutes, focus on text between <span>
- ex06 dupplicate attribute on parent tags, use keyword 'and'
- assignment practice input, click element in dropdown, select checkbox, click button

#### eBay
> Focus on testing real web application with "Page Object Model" pattern from Resources folder <br/>
> The idea of `POM` is to seperate common functions following pages or navigation to use with many places.<br/>
> The commonFunctionality.robot is common functions that can use for all test suites like open and close browser.

#### DemoQA
> Focus on practice all Elements, Forms, Alert, Frame & Windows, Widgets, Interactions, Book Store Application
- broke.robot is focus on veiry image valid/invalid and link valid/invalid

### API automation
> require `pip install robotframework-requests`
> Run local server by `java -jar doppio_api.jar`
> File for test web automation is in folder `ep03_material_v2` for test on localhost <br/>

### Android automation
> required `pip install robotframework-robotframework-appiumlibrary`
> File for test web automation is in folder `ep02_material` for test on localhost <br/>
- Download `Android studio` and then set PATH `ANDROID_HOME` under system (path from SDK Manager)
- Download `Appmium` and `Appmium Inspector`
- Download openJDK8 and then set PATH `JAVA_HOME` under system
- Start `Virtual Device Manager` on `Android studio` and install `com.material.components.apk`
- Appium Server GUI -> Advanced > Server address: localhost, Port: 4723, Allow CORP: yes
- Appium Inspector -> Remote host: localhost, Port: 4723, Path: /wd/hub
- Copy json in `ep2_material\ep2\testapp.json` to put in `Appium Inspector` and then `Start Session`

The json data meaning..<br/>
> I want to run test on Android 11 device with application = com.material.components <br/>
> Start screen = com.material.components.activity.MainMenu <br/>

Appium Inspector act as client to sent JSON data to Appium Server for create session. The Appium Server act as middle man that translate JSON data into native framework for both andorid and ios for interacting with that application.But, we also can use robot framework to be client call data to Appium Server.<br/>

Execution time fast-slow: Accessibility ID > ID > (UISelector, Xpath)

### Python Selenium
> refer: https://selenium-python.readthedocs.io/page-objects.html

```markdown
/Python Selenium/testcase
	main.py (main test cases)
	page.py (verify the testing page)
  	locator.py (keep any attribute like class,id)
        element.py (base function for any element use like search that need to wait page to see element)
```

### Other useful links for practice robot framework

- Material ep01-ep03 is from [Doppio Tech Youtube](https://www.youtube.com/channel/UCmx_h_QeDQmI5SS0maT4lNw/playlists) **Thai language**
- [https://demoqa.com/automation-practice-form](https://demoqa.com/automation-practice-form)
- [http://automationpractice.com/index.php](http://automationpractice.com/index.php)
- [http://the-internet.herokuapp.com/](http://the-internet.herokuapp.com/)
- [https://phptravels.com/demo](https://phptravels.com/demo)
- [https://testautomationpractice.blogspot.com/](https://testautomationpractice.blogspot.com/)