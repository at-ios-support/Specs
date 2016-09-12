Pod::Spec.new do |s|
    s.name                  = 'FaceHub'
    s.version               = '0.95'
    s.summary               = 'A cocoapod contains the FaceHub framework.'
    s.homepage              = 'http://asiantech.vn'
    s.license               = { :type => 'MIT', :file => 'LICENSE' }
    s.authors               = { 'DaoNV' => 'daonv@asiantech.vn' }

    s.platform              = :ios
    s.ios.deployment_target = '8.0'
    s.requires_arc          = true

    s.source                = { :http => '' }
    s.libraries             = 'c++'
    s.frameworks            = 'Foundation', 'UIKit', 'AudioToolbox', 'AVFoundation', 'CoreMedia', 'VideoToolbox', 'GLKit', 'SystemConfiguration', 'FaceHub'
    s.xcconfig              = { 'OTHER_LDFLAGS' => '-ObjC' }
    s.vendored_frameworks   = 'FaceHub.framework'
    s.resources             = 'FaceHubResources.bundle'
end
