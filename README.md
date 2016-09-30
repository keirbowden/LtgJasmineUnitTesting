# Unit Testing Lightning Components with Jasmine
Codebase for my Dreamforce 16 Dev Zone Talk. You can find the slides [here](http://www.slideshare.net/keirb/unit-testing-lightning-components-with-jasmine).

## My Domain
Lightning components require My Domain so don't forget to turn that on first!

## Unmanaged Package
While all the code elements are here and you can deploy them to your Salesforce instance, it's easier
(particularly when deploying Lightning Components!) to install the unmanaged package:

https://login.salesforce.com/packaging/installPackage.apexp?p0=04t580000007djW

## Set up Test Data
You'll need some date in order to try out the test application. You can create this yourself or you
can execute the following Apex code (from the Developer Console Debug -> Execute Anonymous window, for example):

    JobsSetup.SetupData();

## Jobs App
Access the jobs app via the `JobsApp.app` Lightning Application. Open this in the Developer Console via the 
File -> Open Lightning Resources menu. Once you have this open, click the ``Preview`` pane on the top right of the page.

The application will open via a URL with the following format:

https://&lt;mydomain&gt;.lightning.force.com/c/JobsTestApp.app

e.g. in one of my dev orgs this is:

https://trailheadident-dev-ed.lightning.force.com/c/JobsTestApp.app

## Jobs Test App
Access the jobs test app via the `JobsTestApp.app` Lightning Application, using the same mechanism as above. 
This loads the test page :

![jobtestapp](https://cloud.githubusercontent.com/assets/1392613/18922520/dbe03384-85a0-11e6-919a-2756f438b747.png)

Click one of the buttons to execute the tests and report the results.

