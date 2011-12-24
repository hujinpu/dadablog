# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'dadablog/version'

Gem::Specification.new do |s|
  s.name        = 'dadablog'
  s.version     = Dadablog::VERSION
  s.authors     = ['Jinpu Hu (胡金埔)']
  s.email       = ['hujinpu@gmail.com']
  s.homepage    = 'http://w3er.com'
  s.summary     = %q{a simple blog engine}
  s.description = %q{dadablog is a simple blog engine, is very friendly to github and rack protocol.}

  s.rubyforge_project = 'dadablog'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency 'sinatra'
  s.add_runtime_dependency 'rack-cache'
  s.add_runtime_dependency 'html_truncator'
  s.add_runtime_dependency 'thin'
  s.add_runtime_dependency 'rdiscount'
  s.add_runtime_dependency 'thor'

  #s.add_development_dependency 'cucumber'
  #s.add_development_dependency 'aruba'
  #s.add_development_dependency 'rspec', '~> 2.7'
end
