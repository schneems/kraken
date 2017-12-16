lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kraken/version'

Gem::Specification.new do |spec|
  spec.name          = 'kraken'
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

  spec.add_runtime_dependency 'redis', '~> 3.3', '>= 3.3.1'
  spec.add_runtime_dependency 'require_all', '~> 1.3', '>= 1.3.3'

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'coveralls', '~> 0.8.21'
  spec.add_development_dependency 'pry', '~> 0.11.3'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.7'
  spec.add_development_dependency 'rubocop', '~> 0.52.0'
end
