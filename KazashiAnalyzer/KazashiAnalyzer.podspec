Pod::Spec.new do |s|
    s.name                  = 'KazashiAnalyzer'
    s.version               = '1.0.6'
    s.summary               = 'A cocoapod contains the KazashiAnalyzer framework.'
    s.homepage              = 'http://asiantech.vn'
    s.license               = { :type => 'MIT', :file => 'LICENSE' }
    s.authors               = { 'LnC' => 'truongnv@asiantech.vn' }

    s.platform              = :ios
    s.ios.deployment_target = '8.0'
    s.requires_arc          = true

    s.source                = { :http => "https://github.com/at-ios-support/Specs/raw/KazashiAnalyzer/#{s.version}/KazashiAnalyzer/KazashiAnalyzer.zip" }
    s.libraries             = 'c++'
    s.frameworks            = 'AudioToolbox', 'Foundation', 'UIKit','CoreVideo', 'CoreMedia','AVFoundation', 'KazashiAnalyzer'
    s.xcconfig              = { 'OTHER_LDFLAGS' => '-ObjC' }
    s.vendored_frameworks   = 'KazashiAnalyzer.zip'
    s.resources             = 'KazashiAnalyzerResources.zip'
end
