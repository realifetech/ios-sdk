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
    ... code to run once call has finished ... 
}
```
Registering the device must happen at least once before your App can communicate with our backend. This creates an identiy for your users device. It a separate task to configuring the SDK. 

You can register a device multiple times, however only one call to register can occur at a time. Sequential calls will be queued in memory and repeat on failure.

Note: The SDK will handle initial device registration. A call to register will be sent automatically as part of `RealifeTech.configureSDK(_: SDKConfiguration)`

Note: that calls to register may never complete: 

## SDK Ready
``` swift
RealifeTech.General.sdkReady /// Returns Bool
```
This property can be used to check if the SDK has been configured and the device has registered:

## Device Identifier
``` swift
RealifeTech.General.deviceIdentifier /// Returns String
```
A convenience method which returns the (device' vendor identifier)[https://developer.apple.com/documentation/uikit/uidevice/1620059-identifierforvendor] string (persistant within app installations).


# Internal Documentation
The following is intended for RealifeTech developers of the SDK. If you fork or customise the SDK, you may find these notes useful.

## Project Structure
If you clone the project and switch to the `develop` branch, you should you have an `RealifeTech-SDK.xcodeproj` available in the root.

This Xcode project has the following directory/target structure:

### SDK Project
* RealifeTech-SDK -  Publically consumed module
* General 
* Communicate
* SupportingModules
    * ReachabilityChecker
    * UIDeviceHelper
    * APILayer
### Dummy Project
* Dummy Project - A single view app for testing SDK behaviour
### Pods
* Contains dependencies, controlled through `Podfile`

All the modules within the SDK Project have their own build targets with their own test suites/targets. Test suites are nested inside the modules.

## Adding a new Module

1. Add a new target to the SDK project, choose to add unit tests
2. Nest the unit tests
    - Within Xcode, drag the unit test directory inside the module directory.
    - Open the unit test target's scheme
    - Filter by `info.plist file` under Packaging
    - Update the `info.plist` file location
3. Add CocoaPods to the target
    - Open the Podfile under the Pods project
    - Add the new target + test boilerplate (copy an existing one)
    - Move one of the pods to directly inside the new target, and a copy into the test target*
    - Run `$ pod install`
    - Move the pod back to the head of the file

*A bug in CocoaPods means that unless we add a specific pod for that target at least one, the target never has the right build steps added.

## Dependencies

If a module depends on another, the dependency should be added in the Xcode project navigator. You can see an example of this by selecting the *RealifeTech* target, you can see in the General tab under *Frameworks and Libraries* that it depends on the *General* target.

3rd Party dependencies are managed thorugh CocoaPods. Due to the nature of CocoaPods, they need to be exposed across all the targets in the SDK project/dummy project, so simply add them to the Podfile in the head.

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