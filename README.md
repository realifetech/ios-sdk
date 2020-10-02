# RealifeTech iOS-SDK
⚠️ This project is currently under early phase development ⚠️

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
    - Move one of the pods to directly inside the new target, and a copy into the test target
    - Run `$ pod install`
    - Move the pod back to the head of the file

A bug in CocoaPods means that unless we add a specific pod for that target at least one, the target never has the right build steps added, hence the extra steps.

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