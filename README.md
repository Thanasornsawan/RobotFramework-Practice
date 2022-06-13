## Robot framework selenium basic

Start robot by `robot {filename.robot}`

### Web automation
> require `pip install robotframework` and `pip install robotframework-seleniumlibrary` <br/>
> Download chrome driver and set into PATH system.<br/>
> File for test web automation is in folder `ep01_material` for test on localhost <br/>
- ex00 focus on input text that have unique ID
- ex01 focus on input text that have custom attribute 'v'
- ex02 focus on parent tag <div> have custom attribute 'v'
- ex03 focus on parent tag <div> have custom attribute 'v' + random value
- ex04 both parent 'div tag' and child 'input tag' not have attribute but <span> have custom attribute 'c'
- ex05 None of tags has attruibutes, focus on text between <span>
- ex06 dupplicate attribute on parent tags, use keyword 'and'
- assignment practice input, click element in dropdown, select checkbox, click button

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