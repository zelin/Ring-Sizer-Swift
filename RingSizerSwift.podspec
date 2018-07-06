Pod::Spec.new do |s|
  s.name             = 'RingSizerSwift'
  s.version          = '0.1.0'
  s.summary          = 'Ring Sizer UIView to display ring size'
 
  s.description      = <<-DESC
Ring Sizer is a simple widget to find the ring size by placing ring on iPhone/iPad screen. 
                       DESC
 
  s.homepage         = 'https://github.com/zelin/Ring-Sizer-Swift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Muhammad Umar' => 'ee_umar@yahoo.com' }
  s.source           = { :git => 'https://github.com/zelin/Ring-Sizer-Swift.git', :tag => s.version.to_s }
  s.swift_version    = '4.1'
  s.ios.deployment_target = '8.1'
  s.source_files = 'RingSizerSwift/Library/*'
 
end