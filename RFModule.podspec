#
# Be sure to run `pod lib lint RFModule.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RFModule'
  s.version          = '0.1.10'
  s.summary          = 'Meaningful short summary description of RFModule.'

  s.description      = <<-DESC
TODO: Meaningful long long summary description of RFModule.
                       DESC

  s.homepage         = 'https://www.raiffeisen.ru/'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Golofaev' => 'Roman.GOLOFAEV@raiffeisen.ru' }
  s.source           = { :git => 'https://bitbucket.raiffeisen.ru/scm/rios/rfmodule.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.3'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }
  s.swift_version = '4.0'

  s.source_files = 'RFModule/Classes/**/*'

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
end
