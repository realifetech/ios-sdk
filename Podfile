platform :ios, '13.0'
inhibit_all_warnings!

workspace 'RealifeTech-SDK'
project 'RealifeTech-SDK'

pod 'SwiftLint', '~> 0.43.1'
pod 'RxSwift', '~> 6.1.0'
pod 'RxCocoa', '~> 6.1.0'
pod 'Apollo', '~> 0.40.0'
pod 'Apollo/SQLite'

target 'RealifeTech' do
  use_frameworks!
  project 'RealifeTech-SDK'

  target 'RealifeTechTests' do
    pod 'RxTest', '~> 6.1.0'
  end
end

target 'GraphQL' do
  use_frameworks!
  project 'RealifeTech-SDK'
end
