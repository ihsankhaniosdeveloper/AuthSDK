Pod::Spec.new do |spec|
  spec.name         = "AuthSDK"
  spec.version      = "0.0.2"  # Increment the version
  spec.summary      = "A simple SDK for login and signup functionalities."
  spec.description  = <<-DESC
  AuthSDK is a simple iOS SDK that provides login and signup functionalities.
  This SDK uses URLSession for networking and supports encoding/decoding of 
  JSON data using Codable.
  DESC
  spec.homepage     = "https://github.com/ihsankhaniosdeveloper/AuthSDK"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "ihsankhaniosdeveloper" => "ihsankhaniosdeveloper@gmail.com" }
  spec.platform     = :ios, "10.0"
  spec.source       = { :git => "https://github.com/ihsankhaniosdeveloper/AuthSDK.git", :tag => "#{spec.version}" }
  spec.source_files = 'AuthSDK/**/*.{swift,h,m}'
  spec.requires_arc = true
end
