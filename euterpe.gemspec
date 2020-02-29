# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'euterpe/version'

Gem::Specification.new do |spec|
  spec.name          = 'euterpe'
  spec.version       = Euterpe::VERSION
  spec.authors       = ['Victor Makoed']
  spec.email         = ['vmakoed@gmail.com']

  spec.summary       = 'Conversion of music track links between streaming providers'
  spec.homepage      = 'http://rubygems.org/gems/euterpe'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/vmakoed/euterpe'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'pry', '~> 0.12.2'
  spec.add_development_dependency 'rake', '>= 12.3.2', '~> 13.0'
  spec.add_development_dependency 'rubocop', '~> 0.73.0'

  spec.add_dependency 'activesupport', '~> 5.2', '>= 5.2.3'
  spec.add_dependency 'itunes-search-api', '~> 0.1.0'
  spec.add_dependency 'rspotify', '~> 2.6'
end
