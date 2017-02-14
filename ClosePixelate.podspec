Pod::Spec.new do |s|
  s.name         = "ClosePixelate"
  s.version      = "1.1.1"
  s.summary      = "Cocoa port of https://github.com/desandro/close-pixelate"
  s.homepage     = "https://github.com/bmaslakov/cocoa-close-pixelate"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "bmaslakov" => "b.maslakov@gmail.com" }
  s.requires_arc = true
  s.platform     = :ios
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/bmaslakov/cocoa-close-pixelate", :tag => s.version }
  s.source_files  = "ClosePixelate/ClosePixelate/*.swift"
  s.pod_target_xcconfig =  { 'SWIFT_VERSION' => '3.0' }
end
