Gem::Specification.new do |s|
  s.name        = 'simple_migrations'
  s.version     = '1.0.0'
  s.licenses    = ['MIT']
  s.summary     = 'SQL only migrations'

  s.authors     = ["Tyler Hartland"]
  s.email       = 'tylerhartland7@gmail.com'
  s.files       = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.require_paths = ["lib"]
  s.homepage    = 'https://github.com/th7/simple_migrations'
  s.metadata    = { 'source_code_uri' => 'https://github.com/th7/simple_migrations' }

  s.add_dependency "rake", '~> 13.0'

  s.add_development_dependency 'pg', '~> 1.0'
  s.add_development_dependency "bundler", "~> 2.0"
  s.add_development_dependency "rspec", "~> 3.0"
end
