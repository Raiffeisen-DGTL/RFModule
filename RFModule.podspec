#
# Be sure to run `pod lib lint RFModule.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RFModule'
  s.version          = `make get_version`
  s.summary          = 'RFModule framework that helps to build independent modules'

  s.description      = <<-DESC
RFModule framework that helps to build independent modules.
It is simple protocol with input, output and transitioning.
All you need is create ModuleHandler and set its input and output.
more info - https://habr.com/ru/company/raiffeisenbank/blog/448206/
                       DESC

  s.homepage         = 'https://www.raiffeisen.ru/'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Golofaev' => 'Roman.GOLOFAEV@raiffeisen.ru' }
  s.source           = {
      :git => `make get_source`,
      :tag => s.version.to_s
  }

  s.ios.deployment_target = '9.3'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '5.0' }
  s.swift_version = '5.0'

  s.source_files = 'RFModule/Classes/**/*'

  s.frameworks = 'UIKit'
end
