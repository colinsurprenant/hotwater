# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hotwater/version'

Gem::Specification.new do |gem|
  gem.name          = "hotwater"
  gem.version       = Hotwater::VERSION
  gem.authors       = ["Colin Surprenant"]
  gem.email         = ["colin.surprenant@gmail.com"]
  gem.description   = "Ruby & JRuby gem with fast string edit distance algorithms C implementations with FFI bindings"
  gem.summary       = "Fast string edit distance"
  gem.homepage      = "http://github.com/colinsurprenant/hotwater"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.extensions    = ["ext/hotwater/Rakefile"]

  gem.add_dependency 'rake'
  gem.add_dependency 'ffi'
  gem.add_dependency 'ffi-compiler'
  
  gem.add_development_dependency 'rspec'
end
