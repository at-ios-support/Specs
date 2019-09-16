Pod::Spec.new do |s|
    s.name                  = 'FaceHub'
    s.version               = '2.13'
    s.summary               = 'A cocoapod contains the FaceHub framework.'
    s.homepage              = 'http://asiantech.vn'
    s.license               = { :type => 'MIT', :file => 'LICENSE' }
    s.authors               = { 'LnC' => 'truong.nguyen@asiantech.vn' }

    s.platform              = :ios
    s.ios.deployment_target = '8.0'
    s.requires_arc          = true

    s.source                = { :http => "https://github.com/at-ios-support/Specs/raw/facehub/#{s.version}/FaceHub/FaceHub.zip" }
    s.libraries             = 'c++'
    s.frameworks            = 'Foundation', 'UIKit', 'AudioToolbox', 'AVFoundation', 'CoreMedia', 'VideoToolbox', 'GLKit', 'SystemConfiguration', 'Photos', 'CoreTelephony', 'MobileCoreServices', 'FaceHub'
    s.xcconfig              = { 'OTHER_LDFLAGS' => '-ObjC' }
    s.vendored_frameworks   = 'FaceHub.framework', 'WebRTC.framework'
    s.resource              = 'FaceHubResources.bundle'
end
