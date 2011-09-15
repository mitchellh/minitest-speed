$:.unshift File.expand_path("../lib", __FILE__)
require "minitest/speed/version"

Gem::Specification.new do |s|
  s.name          = "minitest-speed"
  s.version       = Minitest::Speed::VERSION
  s.platform      = Gem::Platform::RUBY
  s.authors       = ["Mitchell Hashimoto"]
  s.email         = ["mitchell.hashimoto@gmail.com"]
  s.summary       = "minitest-speed provides a custom runner to output speed results"
  s.description   = "minitest-speed provides a custom runner to output speed results"

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "minitest-speed"

  s.add_dependency "minitest", "~> 2.6.0"

  s.files         = `git ls-files`.split("\n")
  s.executables   = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path  = 'lib'
end

