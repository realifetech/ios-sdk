# Getting Started
 
This repository contains the RealifeTech SDK which can be installed into your Swift project using the CocoaPods dependency manager. Here you'll find a guide on getting started, and examples of how to use the SDK's features.

## 1. Ensure the following requirements are met
* XCode 11.3+
* Deployment Target of iOS 13.0+
* [CocoaPods](https://guides.cocoapods.org/using/getting-started.html) 1.8.4+
* Swift 5

Note that our SDK currently depends on RxSwift packages which are automatically managed with CocoaPods. This package should be compatible with any peer requirements on RxSwft and RxCocoa versions greater than 4.2.

## 2. Install the RealifeTech-SDK/Core Pod dependency

Add the following line to your `.podfile` under your Apps target:
``` ruby
pod 'RealifeTech-SDK/Core'
```
Open your terminal, navigate to the directory containing your podfile, and run:
``` shell
$ pod install
```

# Configuration

To use the core services of the SDK, you need to initialise the CoreSDKConfiguration first. Use the following function to configure the SDK. You will be provided the values necessary as part of your onboarding.  Note that the SDK provides default values for its API endpoints, unless you are provided with unique endpoints as part of onboarding leave these fields blank.

```
let configuration = CoreSDKConfiguration(
    appCode: “APPLICATION_CODE”,
    clientSecret: “API_SECRET”,
    apiUrl: “http://API_URL”, // OPTIONAL
    graphApiUrl: “http://GRAPH_API_URL” // OPTIONAL
)
```

# Setup core services

RealifeTech-SDK/Core provides factory methods in `CoreFactory` to allow you to initialise the services.

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

To ensure the SDK is configured before any other functionality is used, we recommend adding the code to your `AppDelegate’s applicationDidFinishLaunching(_:)`.
