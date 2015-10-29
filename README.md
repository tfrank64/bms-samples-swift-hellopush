# HelloPush application for IBM MobileFirst Services on IBM Bluemix
---
The HelloPush sample contains an Objective-C project that you can use to learn the IBM Push Notification Service.  
### Downloading the samples
Clone the samples from IBM DevOps Services with the following command:

git clone https://github.com/ibm-bluemix-mobile-services/bms-samples-ios-hellopush

### Configure the back end for your Bluelist application
Before you can run the Bluelist application, you must set up an app on Bluemix.  For simplicity, the steps below outline how to create a MobileFirst Services Starter application which includes the following: Node.js runtime, IBM Push Notifications, Mobile Client Access, and Cloudant services.

1. Sign up for a [Bluemix](http://bluemix.net) Account.
2. Create a mobile app.  In the Boilerplates section Bluemix catalog, click **MobileFirst Services Starter**.  Choose a **Name** and click **Create**.
3. Configure Push: In the IBM Push Notifications Dashboard upload a valid APNs enabled push certificate (.p12 file). This can be completed in the Configuration tab in this dashboard.


### Configure the front end in the HelloPush sample
1. In a terminal, navigate to the bms-samples-ios-hellopush directory where the project was cloned
2. Navigate to the helloPush_objective_c 
3. Install Cocoapod client if not already installed `sudo gem install cocoapods`
4. Configure the Cocoapod repository if not already configured `pod setup`
5. Run the `pod install` command to download and install dependecies.
6. Open the Xcode workspace: `open helloPush.xcworkspace`. From now on, open the xcworkspace file since it contains all the dependencies and configuration.
7. Open the AppDelegate.m and add the corresponding ApplicationRoute and
ApplicationID in the application's' didFinishLaunchingWithOptions method:


Objective C:

(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

//initialize SDK with IBM Bluemix application ID and route
//TODO: Please Enter a valid ApplicationRoute for initializaWithBacken Route and a valid ApplicationId for backenGUID
IMFClient *imfClient = [IMFClient sharedInstance];
[imfClient initializeWithBackendRoute:@"<APPLICATION_ROUTE>" backendGUID:@"<APPLICATION_ID>"];			

return YES;
}



### Run the iOS App
In order to have push notifications run successfully you must run the sample on a physical iOS device. You will also need a valid APNs enabled bundle id, provisioning profile, and development certificate.

When you run the application you will see a single view application with a "Register for Push" button. When you click this button the application will attempt to register the device and application for push notifications. An alert will be displayed in the app showing if the registration was successful or not. When a push notification is received and the application is in the foreground, an alert will be displayed showing the notification's content.'The application uses the ApplicationRoute and ApplicationID specified in the AppDelegate in order to connect against the IBM Push Notification Service on Bluemix. Registration status and other content is also output in the Xcode Console 


Note: This application has been built to run on the latest version of XCode (7.0). The application has been updated to set Enable Bitcode to No in the build-settings as a workaround for the these settings introduced in iOS 9. For more info please see the following blog:

[Connect Your iOS 9 App to Bluemix](https://developer.ibm.com/bluemix/2015/09/16/connect-your-ios-9-app-to-bluemix/)

### License
This package contains sample code provided in source code form. The samples are licensed under the under the Apache License, Version 2.0 (the "License"). You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0 and may also view the license in the license.txt file within this package. Also see the notices.txt file within this package for additional notices.
