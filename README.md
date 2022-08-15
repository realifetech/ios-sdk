# Getting Started

This repository contains the RealifeTech SDK which can be installed into your Swift project using the CocoaPods dependency manager. Here you'll find a guide on getting started, and examples of how to use the SDK's features.

## 1. Ensure the following requirements are met
* XCode 11.3+
* Deployment Target of iOS 13.0+
* [CocoaPods](https://guides.cocoapods.org/using/getting-started.html) 1.8.4+
* Swift 5

Note that our SDK currently depends on RxSwift packages which are automatically managed with CocoaPods. This package should be compatible with any peer requirements on RxSwift and RxCocoa versions greater than 6.1.

## 2. Install the RealifeTech-SDK Pod dependency

Add the following line to your `Podfile` under your Apps target:
``` ruby
pod 'RealifeTech-SDK'
```
Open your terminal, navigate to the directory containing your podfile, and run:
``` shell
$ pod install
```

## 3. Setup the SDK at runtime
1. Ensure you configure the SDK before calling any of this methods (see **Configuration** section below).
2. You will also need to complete **Device Registration** (see below) before you can use the rest of the SDK methods.

# Configuration

**Important: Using the SDK without calling configuring can lead to runtime errors. Do not forget to configure the SDK.**

Use the following function to configure the SDK for use. You will be provided the values necessary as part of your onboarding. Note that the SDK provides default values for its API endpoints, unless you are provided with unique endpoints as part of onboarding leave these fields blank.

``` swift
let configuration = CoreConfiguration(
    appCode: "APPLICATION_CODE",
    clientSecret: "API_SECRET",
    apiUrl: "http://API_URL", // OPTIONAL
    graphQLApiUrl: "http://GRAPH_API_URL" // OPTIONAL
)
RealifeTech.configureSDK(with: configuration)
```
To ensure the SDK is configured before any other functionality is used, we recommend adding the code to your `AppDelegate`'s `applicationDidFinishLaunching(_:)`.

# Setup core services
RealifeTech-SDK provides factory methods in `CoreFactory` to allow you to initialise the services.

1. ***UIDeviceInterface***: A helper to get the UUID, model and system version of the current device.
```
static func makeDeviceHelper() -> UIDeviceInterface
```

2. ***ReachabilityChecking***: A helper to detect network connection and Bluetooth state.
```
static func makeReachablitiyChecker() -> ReachabilityChecking
```

3. ***APITokenManagable***: A helper to setups RealifeTech API with setting the deviceId and configuration to the requesters.
```
static func makeApiHelper(deviceId: String, configuration: CoreSDKConfiguration) -> APITokenManagable
```

4. ***GraphQLDispatching***: A dispatcher to request RealifeTech GraphQL API
```
static func makeGraphQLDispatcher(
        configuration: CoreSDKConfiguration,
        tokenHelper: APITokenManagable,
        deviceId: String,
        reachabilityHelper: ReachabilityChecking
    ) -> GraphQLDispatching
```

5. Get the valid token for using RealifeTech APIs.
```
static func requestValidToken(fromApiHelper apiHelper: APITokenManagable)
```

# General

## Device Registration
Interfacing with our backend systems requires that your device be registered with them. You can use the below function to register the device.


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

Alternatively, you can register a device token arbitrarily, or after passing it through your own logic. In which case use `registerForPushNotifications(token: String)`.

Until the token has successfully been sent to our backend, it will be stored persistantly. When the app launches, we will attempt to send a pending token. Only one token can be stored at a time.

# Analytics
Use the following function to log an analytic event

``` swift
RealifeTech.Analytics.track(
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
# Tracking Push Notification Analytics
## Tracking Receives
### Option 1: Track even if app is force quit
This option is more involved, but will give you the ability to track push notifications when the app is foreground, background, or inactive (force-quit).

The general approach to doing so is that you must implement a “Notification Service Extension” and when its didReceive function is called, call our SDK in order to track.
#### Requirements
Ensure that your push notification payload contains "mutable-content": 1 

#### Steps
- **Add Notification Service Extension (NSE) target in Xcode**
- **Enable App Group capability with appGroupId - this allows the app to execute code when our app is closed.**
- **Pass appGroupId to configure NSE in SDK:**
    - Call configureNotificationExtensionWith(appGroupId:configuration)in your didFinishLaunchingWithOptions function.
- **Use RLTNotificationsTracker in NSE target to track push received:**
    - Initialise RLTNotificationsTracker with AppGroup ID, and call didReceive(request:withContentHandler:) in NotificationService.swift didReceive function. 

### Option 2: Only track if app is in foreground or background
If you don’t want to use “Notification Service Extension“, and are comfortable that you will not receive tracking events for pushes received when the app has been force-quit, you can use the below function in AppDelegate to track notifications received, and in turn call our SDK.
``` swift
application(_:didReceiveRemoteNotification:fetchCompletionHandler: @escaping (UIBackgroundFetchResult) -> Void)
```
#### Limitations
This function won’t get fired when app is in-active (force-quit) which means you can only track the notifications received when app is in foreground and background.

When your app is in foreground, user cannot see the push alert popup on the device. You will need to write code to manually show an alert yourself.

#### Requirements
- Enable “Background Modes - Remote notifications” capability in Xcode
- Ensure that your push notification payload contains `"content-available": 1`

#### Steps
In the application(_:didReceiveRemoteNotification:fetchCompletionHandler, you call SDK Communicate().trackPush function with:
* event: .received
* trackInfo: userInfo

``` swift
RealifeTech.Communicate().trackPush(event: .received, trackInfo: userInfo) {
  completionHandler(.noData)
}
```

## Tracking Opens
- Make AppDelegate confirm to the UNUserNotificationCenterDelegate protocol
- This function can track whether app is in background, foreground and in-active(force-quit).
- Assign the AppDelegate as the delegate of the protocol:
``` swift
func application(_:didFinishLaunchingWithOptions) {
  UNUserNotificationCenter.current().delegate = self
}
```

Implement the following:
``` swift
func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
    let userInfo = response.notification.request.content.userInfo
    RealifeTech.Communicate().trackPush(event: .opened, trackInfo: userInfo) {
        completionHandler()
    }
}
```