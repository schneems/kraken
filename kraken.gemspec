lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kraken/version'

Gem::Specification.new do |spec|
  spec.name          = 'krakenlab'
  spec.version       = Kraken::VERSION
  spec.authors       = ['Marlon Henry Schweigert']
  spec.email         = ['fleyhe0@gmail.com']

  spec.summary       = 'Kraken Distribuited MMO Framework.'
  spec.description   = 'A Easy way to project your MMO Server.'
  spec.homepage      = 'http://www.github.com/KrakenLab/kraken'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'bin'
  spec.executables   = ['kraken']
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'active_record_migrations', '5.0.2.1'
  spec.add_runtime_dependency 'activerecord', '~> 5.0', '>= 5.0.0.1'
  spec.add_runtime_dependency 'logger'
  spec.add_runtime_dependency 'ohm'
  spec.add_runtime_dependency 'pg'
  spec.add_runtime_dependency 'project_creator', '2018.1.1'
  spec.add_runtime_dependency 'require_all', '1.5.0'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'faker'
  spec.add_development_dependency 'pronto'
  spec.add_development_dependency 'pronto-flay'
  spec.add_development_dependency 'pronto-rubocop'
  spec.add_development_dependency 'pry', '0.11.3'
  spec.add_development_dependency 'rake', '12.3.0'
  spec.add_development_dependency 'redis'
  spec.add_development_dependency 'rspec', '3.7'
  spec.add_development_dependency 'rubocop', '0.52.0'
end
