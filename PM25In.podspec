Pod::Spec.new do |s|

  # 1
  s.platform = :ios
  s.ios.deployment_target = '8.0'
  s.name = "PM25In"
  s.summary = "Swift framework for PM25.in"
  s.requires_arc = true

  # 2
  s.version = "0.1.0"

  # 3
  s.license = { :type => "MIT", :file => "LICENSE" }

  # 4
  s.author = { "Alex Zhao" => "simplyzhao@gmail.com" }

  # 5
  s.homepage = "https://github.com/simplyzhao/PM25In"

  # 6 - Replace this URL with your own Git URL from "Quick Setup"
  s.source = { :git => "https://github.com/simplyzhao/PM25In.git", :tag => "#{s.version}"}

  # 7
  s.framework = "UIKit"

  # 8
  s.source_files = "PM25In/**/*.{swift}"
end
