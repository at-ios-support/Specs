Pod::Spec.new do |s|
    s.name                  = 'KazashiAnalyzer'
    s.version               = '1.4.4'
    s.summary               = 'A cocoapod contains the KazashiAnalyzer framework. November 07, 2019'
    s.homepage              = 'http://asiantech.vn'
    s.license               = { :type => 'MIT', :file => 'LICENSE' }
    s.authors               = { 'LnC' => 'lnc@asiantech.vn' }

    s.platform              = :ios
    s.ios.deployment_target = '8.0'
    s.requires_arc          = true

    s.source                = { :http => "https://github.com/at-ios-support/Specs/raw/KazashiAnalyzer/#{s.version}/KazashiAnalyzer/KazashiAnalyzer.zip" }
    s.libraries             = 'c++'
    s.frameworks            = 'AudioToolbox', 'Foundation', 'UIKit','CoreVideo', 'CoreMedia','AVFoundation'
    s.xcconfig              = { 'OTHER_LDFLAGS' => '-ObjC' }

    s.vendored_libraries    = 'lib/libKzshAnalyticalEngine.a'
    s.source_files          = 'lib/KzshAnalyzer.h'
    # s.vendored_frameworks   = 'KazashiAnalyzer'
    s.resources             = 'sources/*.*'
end
