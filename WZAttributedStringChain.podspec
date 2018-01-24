Pod::Spec.new do |s|
  s.name         = 'WZAttributedStringChain'
  s.summary      = '对 NSAttributedString 的封装'
  s.version      = '0.1.0'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { 'zhuangyz' => '632647076@qq.com' }
  s.homepage     = 'https://github.com/zhuangyz'
  s.platform     = :ios, '8.0'
  s.ios.deployment_target = '8.0'
  s.source       = { :git => 'https://github.com/zhuangyz/WZAttributedStringChain.git', :tag => s.version.to_s }
  s.requires_arc = true

  s.public_header_files = 'WZAttributedStringChain/WZAttributedStringChain/*.h'
  s.source_files = 'WZAttributedStringChain/WZAttributedStringChain/*.{h,m}'

end
