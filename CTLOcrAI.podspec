

Pod::Spec.new do |spec|
  spec.name         = "CTLOcrAI"
  spec.version      = "1.0.0"
  spec.summary      = "SDK for AI Backend."
  spec.description  = "..."
  spec.homepage     = "https://github.com/haiNam2711/CTLOcrAI"
  spec.license      = "MIT"
  spec.author             = { "hnam2711" => "namcuong2711@gmail.com" }
  spec.source       = { :git => "https://github.com/haiNam2711/CTLOcrAI.git", :tag => "#{spec.version}" }

  spec.swift_version      = "5.7"

  
  spec.ios.deployment_target  = "13.0"

  spec.vendored_frameworks = "CTLOcrAI.xcframework"

end
