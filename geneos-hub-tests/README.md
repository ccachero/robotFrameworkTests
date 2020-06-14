README for Geneos Hub Tests
======================

Geneos Hub Tests utilizing [RobotFramework](https://robotframework.org/)

Description
-----------

Tests will mainly focus on the following tests:
1. Sanity
2. Smoke
3. Regression

Required Software
------------------
1. Test will run on Centos7
2. Python 3
3. Latest version of [RobotFramework](https://robotframework.org/).
4. Docker installed on test machine

Running the tests via Jenkins Job
---------------------------------
As a general overview, this initiative is discussed in [Geneos-Hub Automated Tests](https://ice.itrsgroup.com/display/QA/Geneos-Hub+Automated+Test+System). 

The tests are triggered using a Jenkins job. Parameters are supplied during test build. Parameters are described in [ICE Page](https://ice.itrsgroup.com/display/QA/Geneos-Hub+Automated+Test+Pipeline)

Running the tests manually
---------------------------
1. Checkout the test code in git
2. Go to `/geneos/Test/GWHub`
3. Execute `robot geneos-hub-tests`. This command will execute ALL detected robot test cases. For selected execution, you can read about adding [tags](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#tagging-test-cases) to your tests

Reading the logs
-----------------
After test execution, `output.xml`, `log.html`, and `report.html` files will be generated. Test log execution is at `log.html`

