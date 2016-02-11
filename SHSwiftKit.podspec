Pod::Spec.new do |s|
  s.name             = "SHSwiftKit"
  s.summary          = "Pure Swift Kit with wrappers on Foundation and other iOS Core frameworks."
  s.version          = "0.0.1"
  s.homepage         = "https://github.com/ankitthakur/SHSwiftKit"
  s.license          = 'MIT'
  s.author           = { "Ankit Thakur" => "ankitthakur85@icloud.com" }
  s.source           = {
    :git => "https://github.com/ankitthakur/SHSwiftKit.git",
    :tag => s.version.to_s
  }
  s.social_media_url = 'https://twitter.com/ankitthakur'

  s.ios.deployment_target = '8.0'
  #s.osx.deployment_target = '10.9'

  s.requires_arc = true
  s.ios.source_files = 'Sources/{iOS,Shared}/**/*'
  #s.osx.source_files = 'Sources/{Mac,Shared}/**/*'

  s.ios.frameworks = 'UIKit', 'Foundation'
  # s.osx.frameworks = 'Cocoa', 'Foundation'

  # s.dependency 'Whisper', '~> 1.0'
end
