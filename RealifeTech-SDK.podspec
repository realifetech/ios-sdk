Pod::Spec.new do |spec|

  spec.name         = "RealifeTech-SDK"
  spec.module_name  = "RealifeTech"
  spec.version      = "1.2.5"
  spec.summary      = "Providing integration with the RealifeTech Experience Automation Platform."

  spec.description  = "This is RealifeTech SDK, it provides integration with RealifeTech backend services, providing functionality such as device notification management, audience membership, and analytics logging. Creating a better experience of the real world for every person."

  spec.homepage     = "https://realifetech.com"
  spec.authors      = [
    "Jonathon Albert" => "jonathon.albert@live.com",
    "Olivier Butler" => "olivier.butler@gmail.com",
    "Mickey Lee" => "mickey.lee@realifetech.com"
  ]

  spec.ios.deployment_target = "13.0"
  spec.swift_version         = "5.0"
  spec.source                = { :git => 'https://github.com/realifetech/ios-sdk.git', :branch => 'master', :tag => "#{spec.version}"}

  spec.source_files = [
    '**/*.swift',
    'RealifeTech/RealifeTech.h'
  ]
  spec.exclude_files = [
    '**/Tests/**/*',
    'DummyProject/**/*',
    'Pods/**/*'
  ]
  spec.resource_bundle = { 'RealifeTech' => ['**/Resources/*.lproj/*.strings'] }

  spec.dependency 'RxSwift', '~> 6.1.0'
  spec.dependency 'RxCocoa', '~> 6.1.0'
  spec.dependency 'Apollo', '~> 0.40.0'
  spec.dependency 'Apollo/SQLite'
  spec.dependency 'SwiftLint', '~> 0.43.1'

end
