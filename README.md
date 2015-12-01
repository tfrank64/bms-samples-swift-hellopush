# iOS helloPush application for IBM MobileFirst Services on IBM Bluemix
---
This iOS helloPush sample contains an Objective-C project that you can use to learn more about the IBM Push Notification Service. 

Sections covered to use the helloPush sample for Objective-C:

1. Downloading the samples 
2. Configuring the back end for your helloPush application
3. Configuring the front end in the HelloPush sample
4. Running the iOS app


### Before you begin 
Before you start, make sure you have the following:

- A [Bluemix](http://bluemix.net) account.
- APNs enabled push certificate (.p12 file) and the certificate password for your sandbox environment. For information about how to obtain a p.12 certificate, see the [configuring credentials for a notification provider](https://www.ng.bluemix.net/docs/services/mobilepush/index.html#push_provider) section in the Push documentation.

### Downloading the helloPush sample
Clone the samples from Github with the following command:

git clone https://github.com/ibm-bluemix-mobile-services/bms-samples-ios-hellopush

### Configuring the back end for your helloPush application
Before you can run the helloPush application, you must set up an app on Bluemix.  The following procedure shows you how to create a MobileFirst Services Starter application. A Node.js runtime environment is created so that you can provide server-side functions, such as resource URIs and static files. The Cloudant®NoSQL DB, IBM Push Notifications, and Mobile Client Access services are then added to the app.

Create a mobile backend in the  Bluemix dashboard:

1.	In the Boilerplates section Bluemix catalog, click MobileFirst Services Starter.
2.	Enter a name and host for your mobile backend and click Create.
3.	Click **Finish**.

Configure Push Notification service:

1.	In the IBM Push Notifications Dashboard, go to the Configuration tab to configure your Push Notification Service.  
2.  In the Apple Push Certificate section, select the Sandbox environment
3.   Upload a valid APNs enabled push certificate (.p12 file), then enter the password associated with the certificate.

### Configuring the front end in the helloPush sample
1. In a terminal, navigate to the **bms-samples-ios-hellopush** directory where the project was cloned
2. Navigate to the helloPush_objective_c 
3. If the Cocoapod client is not installed, install it using the following command: `sudo gem install cocoapods`
4.  If the Cocoapod repository is not configured, configure it using the following command: `pod setup`
5. Run the `pod install` command to download and install dependencies.
6. Open the Xcode workspace: `open helloPush.xcworkspace`. From now on, open the xcworkspace file since it contains all the dependencies and configuration.
7. Open the **AppDelegate.m** and add the corresponding **ApplicationRoute** and
**ApplicationID** in the application **didFinishLaunchingWithOptions** method:


Objective C:
```objective-c
(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

//initialize SDK with IBM Bluemix application ID and route
//TODO: Enter a valid ApplicationRoute for initializaWithBacken Route and a valid ApplicationId for backenGUID
IMFClient *imfClient = [IMFClient sharedInstance];
[imfClient initializeWithBackendRoute:@"<APPLICATION_ROUTE>" backendGUID:@"<APPLICATION_ID>"];			

return YES;
}
```



### Running the iOS app
For push notifications to work successfully, you must run the helloPush sample on a physical iOS device. You will also need a valid APNs enabled bundle id, provisioning profile, and development certificate.

When you run the application you will see a single view application with a "Register for Push" button. When you click this button the application will attempt to register the device and application to the Push Notification Service. The app uses an alert to display the registration status (successful or failed).

When a push notification is received and the application is in the foreground, an alert is displayed showing the notification's content. The application uses the **ApplicationRoute** and **ApplicationID** specified in the AppDelegate to connect to the IBM Push Notification Service on Bluemix. The registration status and other information is displayed  in the Xcode Console 


Note: This application runs on the latest version of XCode (7.0). The application has been updated to set Enable Bitcode to No in the build-settings as a workaround for the these settings introduced in iOS 9. For more info please see the following blog:

[Connect Your iOS 9 App to Bluemix](https://developer.ibm.com/bluemix/2015/09/16/connect-your-ios-9-app-to-bluemix/)

### License
This package contains sample code provided in source code form. The samples are licensed under the under the Apache License, Version 2.0 (the "License"). You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0 and may also view the license in the license.txt file within this package. Also see the notices.txt file within this package for additional notices.
