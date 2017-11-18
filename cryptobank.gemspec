
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cryptobank/version'

Gem::Specification.new do |spec|
  spec.name          = 'cryptobank'
  spec.version       = Cryptobank::VERSION
  spec.authors       = ['Grace Christenbery']
  spec.email         = ['grace@gracefulco.de']
  spec.summary       = 'A toolbox for working with cryptocurrencies. Cryptobank provides Ruby wrappers for the Bitcoin API JSON-RPC.'
  spec.homepage      = 'https://github.com/Grace/cryptobank'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'json', '~> 2.1.0'
  spec.add_runtime_dependency 'httparty', '~> 0.15.6'
  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
end
