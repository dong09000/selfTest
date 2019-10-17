

Pod::Spec.new do |spec|

  spec.name         = "dyfOAtestSDK"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of dyfOAtestSDK."
  spec.homepage     = "https://github.com"
 
  spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  spec.author             = { "dongyuefeng" => "dongyuefeng@100tal.com" }
 
 
  # spec.platform     = :ios
  spec.platform     = :ios, "5.0"
  spec.ios.deployment_target = "5.0"
  spec.osx.deployment_target = "10.7"
  spec.watchos.deployment_target = "2.0"
  spec.tvos.deployment_target = "9.0"

  spec.source       = { :git => "https://github.com/dong09000/EditModel.git", :tag => "#{spec.version}" }

  spec.source_files  = "*.{h,m}", "model/*.{h,m}", "model/*/*.{h,m}"
  spec.preserve_paths = "protoc", "proto/*/*.proto", 
  spec.requires_arc = true
  #spec.dependency "Protobuf"

  spec.user_target_xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS=1' }
  spec.pod_target_xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS=1' }
  

end
