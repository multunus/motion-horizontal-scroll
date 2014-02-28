# -*- encoding: utf-8 -*-
Gem::Specification.new do |gem|
  gem.authors       = ["Jerry"]
  gem.email         = ["jerry.john.jacob@live.com"]
  gem.description   = "This controller provides a means of horizontally scrolling through items as opposed to the standard vertical scroll"
  gem.summary       = "Horizontal tableview controller"
  gem.homepage      = "https://github.com/jerryjohnjacob/horizontal_scroll_controller"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "horizontal_scroll_controller"
  gem.require_paths = ["lib"]
  gem.version       = "1.0"
end
