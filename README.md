# Getting Started

This repository contains the RealifeTech SDK which can be installed into your Swift project using the CocoaPods dependency manager. Here you'll find a guide on getting started, and examples of how to use the SDK's features.

## 1. Ensure the following requirements are met
* XCode 11.3+
* Deployment Target of iOS 13.0+
* [CocoaPods](https://guides.cocoapods.org/using/getting-started.html) 1.8.4+
* Swift 5

Note that our SDK currently depends on RxSwift packages which is automatically managed with CocoaPods. This package should be compatable with any peer requirements on RxSwft and RxCocoa versions greater then 4.2.

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
**Important: Using the SDK without calling the configuring method can lead to runtime errors. Do not forget to configure the SDK.**

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

# General Module
Documentation on how to use the General Module

## Device Registration
``` swift
RealifeTech.General.registerDevice { 
    // code to run once call has finished 
}
```
Registering the device must happen at least once before your App can communicate with our backend. This creates an identiy for your users device. It a separate task to configuring the SDK. 

You can register a device multiple times, however only one call to register can occur at a time. Sequential calls will be queued in memory and repeat on failure.

Note: The SDK will handle initial device registration. A call to register will be sent automatically as part of `RealifeTech.configureSDK(_: SDKConfiguration)`

Note: that calls to register may never complete since it repeats on failure.

## SDK Ready
``` swift
RealifeTech.General.sdkReady /// Returns Bool
```
This property can be used to check if the SDK has been configured and the device has registered:

## Device Identifier
``` swift
RealifeTech.General.deviceIdentifier /// Returns String
```
A convenience method which returns the [device' vendor identifier](https://developer.apple.com/documentation/uikit/uidevice/1620059-identifierforvendor) string (persistant for an app installation).

# Communicate
## Registering for Push Notifications
``` swift
RealifeTech.Communicate.registerForPushNotifications(token: String)
// or
RealifeTech.Communicate.registerForPushNotifications(tokenData: Data)
```
Use these method calls to enable the RealifeTech platform to send push notifications to the user's device. This can be silent data or notifications.

You'll usually add this code to the AppDelegate method which [receives an APN token](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/1622958-application) after sucessfully registering with iOS. In this, case pass the Data object direct to the RealifeTech SDK with `registerForPushNotifications(tokenData: Data)`.

Altenatively, you with to register a device token arbitratily, or after passing it through your own logic. In which case use `registerForPushNotifications(token: String)`.

Until the token has successfully been sent to our backend, it will be stored persistantly. When the app launches, we will attempt to send a pending token. Only one token can be stored at a time. 

# Audiences
``` swift
guard RealifeTech.General.sdkReady else { return }
RealifeTech.Audiences.deviceIsMemberOfAudience(audienceId: String) { result in
    switch result {
        case success(isMember):
            self.someMemebershipHandler(isMember, ofAudience: audienceId)
        case failure(error):
            self.someErrorHandler(error)
    }
}
```
Used to determine if the current device is a member of a particular audience group. The method accepts a completion handler which will be passed a result, either an error, or a boolean indicating the membership state.

Note that using this method before the device has been registered will result unpredictable result. You may wish to guard against the SDK state as in the above example.

# Analytics
``` swift
RealifeTech.Analytics().logEvent(
    type: "FoodAndBeverage", 
    action: "purchase", 
    new: ["someValue": 123], 
    old: nil) { result in
        switch result {
        case success:
            // event has been logged
        case failure(let error):
            // handle error
        }        
}
```
Use this method to log an event with our backend. The specific values and structure of log items will vary depending on your use cases, we have no docs at the moment for generic values.

Events will be cached on disk until they have been sucessfully received. We attach a timestamp at the time they are added to preserve the original log time.

---

# Internal Documentation
**Warning:** The following is to assist making changes to the SDK itself. This should not be necessary for normal use of the SDK. If you have a bug we'd love you to [submit a report](https://github.com/realifetech/ios-sdk/issues).

## Project Structure
If you clone the project and switch to the `develop` branch, you should you have an `RealifeTech-SDK.xcodeproj` available in the root.

This Xcode project has the following directory/target structure:

### SDK Project
* RealifeTech-SDK -  Publically consumed module
* General 
* Communicate
* Analytics
* Audiences
* SupportingModules
    * ReachabilityChecker - Tool for checking connectivity options
    * UIDeviceHelper - Wrapper around the UIDevice module
    * APILayer - HTTP API toolset with database like persistance options
    * APIV3Utilities - Extensions to the APILayer for the V3 API
    * GraphQL - Apollo GraphQL wrapper 
    * Repositories - Contains V3API repositories
    * Storage - Contains various generic data stores
### Dummy Project
* Dummy Project - A single view app for testing SDK behaviour
* Pods - The requirements of the dummy project (the RealifeTech SDK)
### Pods
* Contains dependencies, controlled through `Podfile`

Test suites are nested inside the modules.

## Module setup
All our main modules (General, Communicate, Analytics etc.), represent collections of use cases. Each set of use cases should be decoupled from eachother, but we want to expose a single interface for the cases (e.g. `General.someTask()`).

We use the factory & facade patterns. A single light weight facade exists for each module which fowards calls to the underlying business logic. A factory exists which can build all the business logic and inject it into the facade. This keep the code highly decoupled, makes dependency management super easy, and keeps the configuraion highly flexible.

### Worked Example: Analytics

Each set of use cases has a protocol associated with it, for example `AnalyticsLogging` in the `Analytics` module. This use case will have an entity which implements the business logic (in this case `AnalyticsLogger`) along with various helpers and workers all in a single directory.

We combine these use case protocols into a simple `Analytics` typealias. We define a light weight interface `AnalyticsImplementing` // TODO finish this // the interface confirms to the typealias `Analytics` which combines all the use case protocols in that module. The factory `AnalyticsFactory` only specified that it provides an `Analytics` type, not the specific implementation.


## Dependencies

3rd Party dependencies are managed thorugh CocoaPods. Note that we should actively be moving away from RxSwift and aim to remove the dependencies of the SDK.

## Known Issues

### When changing branches, CocoaPods can cause issues
Sometimes after changing between branches which have different projects within the workspace, you may start to see warnings like the following in your console when you install pods:
```
[!] The `DummyProjectTests [Debug]` target overrides the `ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES` build setting defined in `../Pods/Target Support Files/Pods-DummyProject-DummyProjectTests/Pods-DummyProject-DummyProjectTests.debug.xcconfig'. This can lead to problems with the CocoaPods installation
- Use the `$(inherited)` flag, or
- Remove the build settings from the target.
```
This is caused by problems in the `xcconfig` files, and should stop coming up once the project stucture is stable.

To resolve the issue: 
- Go to the relevant target in Xcode
- Open the Build Setting tab. 
- Filter for `Always embed swift standard libraries` (you should see it is bold, indicating a custom setting has been saved).
- Select the line item and press delete (it should no longer be bold)
- Repeat for other affected targets
- Run `$ pod install` again