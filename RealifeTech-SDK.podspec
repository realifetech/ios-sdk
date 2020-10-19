#
#  Be sure to run `pod spec lint ReallifeTech-SDK.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  spec.name         = "RealifeTech-SDK"
  spec.module_name  = "RealifeTech"
  spec.version      = "0.0.1"
  spec.summary      = "Providing integration with the RealifeTech Experience Automation Platform."

  spec.description  = "This is RealifeTech SDK, it provides integration with RealifeTech backend services, providing functionality such as device notification management, audience membership, and analytics logging. Creating a better experience of the real world for every person."

  spec.homepage     = "https://realifetech.com"
  spec.license      = "MIT"
  spec.author       = { "RealifeTech" => "mobile@realifetech.com" }

  spec.ios.deployment_target = "12.0"
  spec.swift_version = "5.0"
  spec.source        = { :git => 'https://github.com/realifetech/ios-sdk.git', :branch => 'develop', :tag => '0.0.1'}
  spec.source_files = [ 'General/**/*.swift', 'Communicate/**/*.swift', 'Audiences/**/*.swift', 'SupportingModules/**/*.swift', 'RealifeTech/**/*.swift', 'RealifeTech/RealifeTech.h']
  spec.exclude_files =  [
      'General/GeneralTests/**/*',
      'Communicate/CommunicateTests/**/*',
      'Audiences/AudiencesTests/**/*',
      'SupportingModules/GraphQL/GraphQLTests/**/*',
      'SupportingModules/APIV3Utilities/APIV3UtilitiesTests/**/*',
      'SupportingModules/APILayer/APILayerTests/**/*',
      'SupportingModules/UIDeviceHelper/UIDeviceHelperTests/**/*',
      'SupportingModules/ReachabilityChecker/ReachabilityCheckerTests/**/*',
      'RealifeTech/RealifeTechTests/**/*']

  spec.dependency "RxSwift", "> 4.2"
  spec.dependency "RxCocoa", "> 4.2"
  spec.dependency "Apollo", "0.30.0"
  spec.dependency "SwiftLint"

end
