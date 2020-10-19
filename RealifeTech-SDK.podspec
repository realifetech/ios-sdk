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
  spec.summary      = "A short description of RealifeTech-SDK."

  spec.description  = "This is realife tech SDK for frameworks that can be used using CocoaPods."

  spec.homepage     = "https://github.com/realifetech"
  spec.license      = "MIT"
  spec.author       = { "NitishSharma" => "punj.nitish@gmail.com" }

  spec.ios.deployment_target = "12.0"
  spec.swift_version = "5.0"
  spec.source        = { :path => '.' }
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
  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See https://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

    # spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  # Or just: spec.author    = "NitishSharma"
  # spec.authors            = { "NitishSharma" => "punj.nitish@gmail.com" }
  # spec.social_media_url   = "https://twitter.com/NitishSharma"

end
