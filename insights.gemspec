# coding: utf-8
$:.push File.expand_path('../lib', __FILE__)
require 'insights/version'

Gem::Specification.new do |s|
  s.name     = 'insights'
  s.version  = Insights::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors  = ['Alexander Kravets', 'Maxym Melnyk']
  s.email    = 'alex@slatestudio.com'
  s.license  = 'MIT'
  s.homepage = 'https://github.com/slate-studio/insights'
  s.summary  = 'Plug Google Analytics into Character dashboard.'

  s.rubyforge_project = 'insights'

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ['lib']

  s.add_dependency("google-api-client")
end
