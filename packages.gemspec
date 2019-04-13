Gem::Specification.new do |s|
  s.name        = 'packages'
  s.version     = '0.0.1'
  s.date        = Time.now.strftime('%Y-%m-%d')

  s.summary     = 'Library for accessing package information'
  s.description = 'Wrapper for providing normalized access to packages information for various systems' # rubocop:disable Metrics/LineLength
  s.authors     = ['Les Aker']
  s.email       = 'me@lesaker.org'
  s.homepage    = 'https://github.com/akerl/packages'
  s.license     = 'MIT'

  s.files       = `git ls-files`.split
  s.test_files  = `git ls-files spec/*`.split

  s.add_development_dependency 'rubocop', '~> 0.67.2'
  s.add_development_dependency 'goodcop', '~> 0.7.0'
  s.add_development_dependency 'rake', '~> 12.3.0'
  s.add_development_dependency 'coveralls', '~> 0.8.0'
  s.add_development_dependency 'rspec', '~> 3.8.0'
  s.add_development_dependency 'fuubar', '~> 2.3.0'
end
