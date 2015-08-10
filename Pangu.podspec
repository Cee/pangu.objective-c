Pod::Spec.new do |s|
  s.name         = "Pangu"
  s.version      = "0.1.1"
  s.summary      = "Paranoid text spacing in Objective-C"
  s.description  = "Paranoid text spacing for good readability, to automatically insert whitespace between CJK (Chinese, Japanese, Korean) and half-width characters (alphabetical letters, numerical digits and symbols)."

  s.homepage     = "https://github.com/Cee/pangu.objective-c"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "Cee" => "cee@chu2byo.com" }

  s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.7'

  s.source       = { :git => "https://github.com/Cee/pangu.objective-c.git", :tag => "v#{s.version.to_s}" }

  s.source_files = "Classes", "Classes/**/*.{h,m}"
end
