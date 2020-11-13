
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