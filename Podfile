use_frameworks!

source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'

target 'REST API Usage' do
pod 'Alamofire', '~> 4.4'
pod 'AlamofireObjectMapper', '~> 4.0'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end