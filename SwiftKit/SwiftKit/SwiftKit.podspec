#
#  Be sure to run `pod spec lint SwiftKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#
Pod::Spec.new do |spec|

    # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
    #
    #  These will help people to find your library, and whilst it
    #  can feel like a chore to fill in it's definitely to your advantage. The
    #  summary should be tweet-length, and the description more in depth.
    #
    spec.name         = 'SwiftKit'
    spec.version      = '0.0.0.1'
    spec.summary      = 'Pure Swift Kit for iOS apps.'
    spec.source       = { :git => 'https://github.com/ankitthakur/SwiftKit.git', :tag => '0.0.0.1' }

    # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
    #
    #  Licensing your code is important. See http://choosealicense.com for more info.
    #  CocoaPods will detect a license file if there is a named LICENSE*
    #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
    #

    spec.license      =  { :type => 'MIT' }

    # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
    #
    #  Specify the authors of the library, with email addresses. Email addresses
    #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
    #  accepts just a name if you'd rather not provide an email address.
    #
    #  Specify a social_media_url where others can refer to, for example a twitter
    #  profile URL.
    #
    spec.homepage     = 'https://github.com/ankitthakur/SwiftKit'
    spec.authors      = { 'Ankit Thakur' => 'ankitthakur85@icloud.com'}
    spec.social_media_url   = "http://twitter.com/ankitthakur"




    # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
    #
    #  If this Pod runs only on iOS or OS X, then specify the platform and
    #  the deployment target. You can optionally include the target after the platform.
    #

    # spec.platform     = :ios
    spec.platform     = :ios, "8.0"

    #  When using multiple platforms
     spec.ios.deployment_target = "8.0"
    # spec.osx.deployment_target = "10.7"
    # spec.watchos.deployment_target = "2.0"
    # spec.tvos.deployment_target = "9.0"

    spec.source_files = 'SwiftKit/**/*.swift'
    #spec.source_files = 'Pod/Classes/**/*'
    spec.resource_bundles = {
    'SwiftKit' => ['Pod/Assets/*.png']
    }

    # spec.public_header_files = 'Pod/Classes/**/*.swift'
    spec.frameworks = 'UIKit', 'Foundation'
    # spec.dependency 'AFNetworking', '~> 2.3'

end
