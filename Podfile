# Uncomment the next line to define a global platform for your project
platform :ios, '12.1'
inhibit_all_warnings!

workspace 'RealifeTech-SDK'
project 'RealifeTech-SDK'
project 'DummyProject/DummyProject'

pod 'SwiftLint'
pod 'RxSwift', '~> 5.1.1'
pod 'RxCocoa', '~> 5.1.1'
pod "Apollo", "0.30.0"

target 'RealifeTech' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  project 'RealifeTech-SDK'

  # Pods for RealifeTech-SDK

  target 'RealifeTechTests' do
    # Pods for testing
    pod 'RxTest', '~> 5.1.1'
  end

end

target 'DummyProject' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  project 'DummyProject/DummyProject'

  # Pods for DummyProject
  
  target 'DummyProjectTests' do
    # Pods for testing
    pod 'RxTest', '~> 5.1.1'
  end

end
