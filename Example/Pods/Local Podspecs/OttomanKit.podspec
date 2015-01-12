#
# Be sure to run `pod lib lint OttomanKit.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "OttomanKit"
  s.version          = "0.1.0"
  s.summary          = "A short description of OttomanKit."
  s.description      = <<-DESC
                       An optional longer description of OttomanKit

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/omgitsads/OttomanKit"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Adam Holt" => "me@adamholt.co.uk" }
  s.source           = { :git => "https://github.com/omgitsads/OttomanKit.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = ['Pod/Classes', 'Pod/Classes/**/*.{h,m}']
  s.resource_bundles = {
    'OttomanKit' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'AFNetworking', '~> 2.5'
  s.dependency 'Mantle', '~> 1.5'
  s.dependency 'BlocksKit', '~> 2.2'
end
