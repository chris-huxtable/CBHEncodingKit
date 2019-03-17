Pod::Spec.new do |spec|

  spec.name                   = "CBHEncodingKit"
  spec.version                = "1.0"
  spec.module_name            = "CBHEncodingKit"

  spec.summary                = "CBHEncodingKit extends `NSData` and `NSString` with a category; adding methods for several encoding types."
  spec.homepage               = "https://github.com/chris-huxtable/CBHEncodingKit"

  spec.license                = { :type => "ISC", :file => "LICENSE" }

  spec.author                 = { "Chris Huxtable" => "chris@huxtable.ca" }
  spec.social_media_url       = "https://twitter.com/@Chris_Huxtable"

  spec.osx.deployment_target  = '10.8'

  spec.source                 = { :git => "https://github.com/chris-huxtable/CBHEncodingKit.git", :tag => "v#{spec.version}" }

  spec.requires_arc           = false

  spec.public_header_files    = 'CBHEncodingKit/*.h'
  spec.source_files           = "CBHEncodingKit/*.{h,m}"

end
