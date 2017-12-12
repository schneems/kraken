# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kraken/version'

Gem::Specification.new do |spec|
  spec.name          = 'kraken'
  spec.version       = Kraken::VERSION
  spec.authors       = ['Marlon Henry Schweigert']
  spec.email         = ['fleyhe0@gmail.com']

  spec.summary       = %q{Kraken Distribuited MMO Framework.}
  spec.description   = %q{A Easy way to project your MMO Server.}
  spec.homepage      = 'http://www.github.com/KrakenLab/kraken'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
end
