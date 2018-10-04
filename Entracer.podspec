#
#  Be sure to run `pod spec lint Entracer.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "Entracer"
  s.version      = "1.0.0"
  s.summary      = "Entracer tracking library for iOS (Swift)"
  s.homepage     = "https://www.entracer.com"
  s.license      = "Apache License, Version 2.0"
  s.author       = { "Entracer" => "info@entracer.com" }
  s.platform     = :ios
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/Entracer/entracer-ios", :tag => "#{s.version}" }
  s.source_files  = ['Entracer/*.swift', 'Entracer/Entracer.h']

end