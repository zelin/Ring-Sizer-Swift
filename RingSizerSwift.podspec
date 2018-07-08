Pod::Spec.new do |s|
  s.name             = 'RingSizerSwift'
  s.version          = '0.0.1'
  s.summary          = 'Ring Sizer view to find the ring size by placing ring on iPhone/iPad screen'
 
  s.description      = <<-DESC
Ring Sizer view to find the ring size by placing ring on iPhone/iPad screen
                       DESC
 
  s.homepage         = 'https://github.com/zelin/Ring-Sizer-Swift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Muhammad Umar' => 'ee_umar@yahoo.com' }
  s.source           = { :git => 'https://github.com/zelin/Ring-Sizer-Swift.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '10.0'
  s.source_files = 'RingSizerSwift/Library/'
 
end