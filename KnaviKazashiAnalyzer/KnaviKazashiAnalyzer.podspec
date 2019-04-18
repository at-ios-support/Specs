Pod::Spec.new do |s|
    s.name                  = 'KnaviKazashiAnalyzer'
    s.version               = '1.4.1'
    s.summary               = 'A cocoapod contains the Knavi KazashiAnalyzer framework for health scan.'
    s.homepage              = 'http://asiantech.vn'
    s.license               = { :type => 'MIT', :file => 'LICENSE' }
    s.authors               = { 'LnC' => 'lnc@asiantech.vn' }

    s.platform              = :ios
    s.ios.deployment_target = '8.0'
    s.requires_arc          = true

    s.source                = { :http => "https://github.com/at-ios-support/Specs/raw/KnaviKazashiAnalyzer/#{s.version}/KnaviKazashiAnalyzer/KnaviKazashiAnalyzer.zip" }
    s.libraries             = 'c++'
    s.frameworks            = 'AudioToolbox', 'Foundation', 'UIKit','CoreVideo', 'CoreMedia','AVFoundation'
    s.xcconfig              = { 'OTHER_LDFLAGS' => '-ObjC' }

    s.vendored_libraries    = 'lib/libKzshAnalyticalEngine.a'
    s.source_files          = 'lib/KzshAnalyzer.h'
    # s.vendored_frameworks   = 'KnaviKazashiAnalyzer'
    s.resources             = 'sources/*.*'
end
