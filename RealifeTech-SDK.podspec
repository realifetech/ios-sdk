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
  spec.authors       = { "Jonathon Albert" => "jonathon.albert@live.com",
			"Olivier Butler" => "olivier.butler@gmail.com" ,
			"Mickey Lee" => "mickey.lee@realifetech.com" }

  spec.ios.deployment_target = "13.0"
  spec.swift_version = "5.0"
  spec.source        = { :git => 'https://github.com/realifetech/ios-sdk.git', :branch => 'develop', :tag => '0.0.1'}

  spec.default_subspecs = 'RealifeTech'

  spec.subspec 'Core' do |s|
    s.source_files = [
      'Core/**/*.swift',
      'RealifeTech/RealifeTech.h'
    ]
    s.exclude_files = [
      'Tests/*',
      '**/Tests/**/*'
    ]
    s.resource_bundle = { "RealifeTech" => ["Core/Resources/*.lproj/*.strings"] }
    s.dependency 'RxSwift', '~> 6.1.0'
    s.dependency 'RxCocoa', '~> 6.1.0'
    s.dependency 'Apollo', '~> 0.40.0'
    s.dependency 'Apollo/SQLite'
  end

  spec.subspec 'RealifeTech' do |s|
    s.source_files = [
      '**/*.swift',
      'RealifeTech/RealifeTech.h'
    ]
    s.exclude_files = [
      '**/Tests/**/*',
      'DummyProject/**/*',
      'Pods/**/*'
    ]
    s.resource_bundle = { "RealifeTech" => ["Content/Resources/*.lproj/*.strings"] }
    s.dependency 'RealifeTech-SDK/Core'
  end

  spec.dependency 'SwiftLint', '~> 0.43.1'

end
