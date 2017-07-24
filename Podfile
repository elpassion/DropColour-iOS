source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!
inhibit_all_warnings!

def pod_ui()
  pod 'SnapKit', '~> 3.2'
  pod 'Spring', :git => 'https://github.com/MengTo/Spring.git', :branch => 'swift3'
end

def pod_infrastructure()
  pod 'Crashlytics', '~> 3.8'
  pod 'Fabric', '~> 1.6'
  pod 'FBSDKCoreKit', '~> 4.2'
  pod 'GA-SDK-IOS', '~> 2.2'
  pod 'Google/Analytics'
  pod 'SwiftLint'
end

target 'ELColorGame' do
  pod_infrastructure()
  pod_ui()
end

target 'ELColorGameTests' do
  pod 'Google/Analytics'
  pod 'Nimble', '~> 7.0'
  pod 'Quick', '~> 1.1'
end
