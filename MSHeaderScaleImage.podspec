
Pod::Spec.new do |s|

  s.name         = "MSHeaderScaleImage"

  s.version      = "1.0.0"

  s.summary      = "简单集成 UITableView headerView 图片缩放效果"

  s.homepage     = "https://github.com/MrSongzj/MSHeaderScaleImage"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "mrsong" => "424607870@qq.com" }

  s.platform     = :ios, "5.0"

  s.source       = { :git => "https://github.com/MrSongzj/MSHeaderScaleImage.git", :tag => "v1.0.0" }

  s.source_files  = "MSHeaderScaleImage/*.{h,m}"

end
