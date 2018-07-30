#
# Be sure to run `pod lib lint RFModule.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RFModule'
  s.version          = '0.1.2'
  s.summary          = 'Meaningful short summary description of RFModule.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Meaningful long long summary description of RFModule.
                       DESC

  s.homepage         = 'https://www.raiffeisen.ru/'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Golofaev' => 'Roman.GOLOFAEV@raiffeisen.ru' }
  s.source           = { :git => 'https://bitbucket.raiffeisen.ru/scm/rios/rfmodule.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.3'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }
  s.swift_version = '4.0'

  s.source_files = 'RFModule/Classes/**/*'
  
  # s.resource_bundles = {
  #   'RFModule' => ['RFModule/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
