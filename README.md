## Robot framework selenium basic

Start robot by `robot {filename.robot}`

### Web automation
- ex00 focus on input text that have unique ID
- ex01 focus on input text that have custom attribute 'v'
- ex02 focus on parent tag <div> have custom attribute 'v'
- ex03 focus on parent tag <div> have custom attribute 'v' + random value
- ex04 both parent <div> and child <input> not have attribute but <span> have custom attribute 'c'
- ex05 None of tags has attruibutes, focus on text between <span>
- ex06 dupplicate attribute on parent tags, use keyword 'and'
- assignment practice input, click element in dropdown, select checkbox, click button

### API automation
Run local server by `java -jar doppio_api.jar`