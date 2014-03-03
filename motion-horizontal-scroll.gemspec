# -*- encoding: utf-8 -*-
Gem::Specification.new do |gem|
  gem.authors       = ["Multunus"]
  gem.email         = ["info@multunus.com"]
  gem.description   = "This RubyMotion gem provides a means of horizontally scrolling through items as opposed to the standard iOS vertical scroll"
  gem.summary       = "Horizontal scroll container for iOS (RubyMotion)"
  gem.homepage      = "https://github.com/multunus/motion-horizontal-scroll"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "motion-horizontal-scroll"
  gem.require_paths = ["lib"]
  gem.version       = "1.0"
end
