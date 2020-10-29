# Getting Started
 
This repository contains the RealifeTech SDK which can be installed into your Swift project using the CocoaPods dependency manager. Here you'll find a guide on getting started, and examples of how to use the SDK's features.

## 1. Ensure the following requirements are met
* XCode 11.3+
* Deployment Target of iOS 13.0+
* [CocoaPods](https://guides.cocoapods.org/using/getting-started.html) 1.8.4+
* Swift 5

Note that our SDK currently depends on RxSwift packages which are automatically managed with CocoaPods. This package should be compatable with any peer requirements on RxSwft and RxCocoa versions greater then 4.2.

## 2. Install the RealifeTechSDK Pod dependency

Add the following line to your `.podfile` under your Apps target:
``` ruby
pod 'RealifeTech-SDK'
```
Open your terminal, navigate to the directory containing your podfile, and run:
``` shell
$ pod install
```

## 3. Setup the SDK at runtime
**Important: Using the SDK without calling configuring can lead to runtime errors. Do not forget to configure the SDK.**

You will have been provided with an application code and a API secret when you setup your RealifeTech account. These must be passed into the SDK when your app launches using the `RealifeTech.configureSDK(with: SDKConfiguration)` method.

We recommend adding the code to your `AppDelegate`'s `applicationDidFinishLaunching(_:)` method:

``` swift
let configuration = SDKConfiguration(
    appCode: "APPLICATION_CODE",
    clientSecret: "API_SECRET")
RealifeTech.configureSDK(with: configuration)
```
Make sure you also import the RealifeTech module in the head the AppDelegate, or whichever files you call the SDK from:
``` swift
import RealifeTech
```
# General

## Configuration

Use the following function(s) to configure the SDK for use. You will be provided the values necessary as part of your onboarding.

``` swift
let configuration = SDKConfiguration(
    appCode: "APPLICATION_CODE",
    clientSecret: "API_SECRET")
RealifeTech.configureSDK(with: configuration)
```

## Device Registration
Interfacing with out backend systems requires that your device be registered with them. You can use the below function to register the device.


``` swift
RealifeTech.General.registerDevice { 
    // code to run once call has finished 
}
```
If the registration fails (for instance due to connectivity issues) we will retry until it is successful. You will not be able to use the majority of the SDK until the device has been registered, and can check the status of it using:

``` swift
RealifeTech.General.sdkReady // Returns Bool
```
# Push Notifications
Use the following function to register the device for push notifications.

``` swift
RealifeTech.Communicate.registerForPushNotifications(tokenData: Data)
```
``` swift
RealifeTech.Communicate.registerForPushNotifications(token: String)
```
You'll usually add this code to the AppDelegate method which [receives an APN token](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/1622958-application) after sucessfully registering with iOS. In this, case pass the Data object directly to the RealifeTech SDK with `registerForPushNotifications(tokenData: Data)`.

Altenatively, you with to register a device token arbitratily, or after passing it through your own logic. In which case use `registerForPushNotifications(token: String)`.

Until the token has successfully been sent to our backend, it will be stored persistantly. When the app launches, we will attempt to send a pending token. Only one token can be stored at a time. 

# Analytics
Use the following function to log an analytic event

``` swift
RealifeTech.Analytics().logEvent(
    type: "type", 
    action: "action", 
    new: ["someValue": "123"], 
    old: nil) { result in
        switch result {
        case success:
            // event has been logged
        case failure(let error):
            // handle error
        }        
}
```
As an example, if you want to log the login to an external system such as Ticketmaster, you would send the following:

* type: `"user"`
* action: `"externalLogin"`
* new: `{"userId": "a3890e983e", "provider": "ticketmaster"}`
* old: `nil`

If the logging fails (for instance due to connectivity issues) we will retry until it is successful.

# Audiences

To determine if the device is a member of an audience, you would use the following function, passing the audienceId:

``` swift
RealifeTech.Audiences.deviceIsMemberOfAudience(audienceId: String) { result in
    switch result {
        case success(let isMember):
            // Our call succeeded
            // Check `isMember` for membership status
        case failure(let error):
            // Handle failure
    }
}
```

Note: You may wish to check whether the SDK is ready before calling:
``` swift
guard RealifeTech.General.sdkReady else { 
    // Handle SDK not yet ready // 
}
```