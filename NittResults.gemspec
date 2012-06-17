# -*- encoding: utf-8 -*-
require File.expand_path('../lib/NittResults/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["nikhil bhardwaj"]
  gem.email         = ["root@nikhilbhardwaj.in"]
  gem.description   = %q{Fetches the results of all the students in the given range of roll numbers from the nitt website}
  gem.summary       = %q{Uses the selenium-webdriver to fetch the result for the specified semester for each student in the range specified by the user. I wrote this so that I could check out the result of all my classmates in one go.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "NittResults"
  gem.require_paths = ["lib"]
  gem.version       = NittResults::VERSION
  # Dependencies
  gem.add_dependency('selenium-webdriver')
end
