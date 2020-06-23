# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$:.unshift(lib) unless $:.include?(lib)
require 'remote_lock/version'

Gem::Specification.new do |gem|
  gem.name          = 'remote_lock'
  gem.version       = RemoteLock::VERSION
  gem.authors       = ['Evolve Team']
  gem.email         = ['evolve@cipherhealth.com']
  gem.description   = %q(remote-based mutexes)
  gem.summary       = %q{Leverages (memcached|redis)'s atomic operation to provide a distributed locking/synchronisation mechanism.}
  gem.homepage      = 'https://github.com/SolarCS/remote_lock'
  gem.license       = 'MIT'

  # gem.add_runtime_dependancy
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'redis'
  gem.add_development_dependency 'memcache-client'
  gem.add_development_dependency 'dalli'

  gem.files         = Dir['{lib}/**/*'] + ['LICENSE', 'Rakefile', 'README.md']
  gem.test_files    = Dir['spec/**/*']
  gem.require_paths = ['lib']
end
