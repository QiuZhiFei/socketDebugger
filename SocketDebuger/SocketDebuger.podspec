Pod::Spec.new do |s|
  s.name             = "SocketDebuger"
  s.version          = "0.0.1"
  s.author           = { "qiuzhifei" => "qiuzhifei521@gmail.com" }

  s.platform     = :ios, '7.0'
  # s.ios.deployment_target = '5.0'
  # s.osx.deployment_target = '10.7'
  s.requires_arc = true

  s.source_files = 'Source/*.{h,m}'

  s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit'

s.dependency 'CocoaAsyncSocket',          '~> 7.4.1'

end
