# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-talks'
  s.version           = '1.0'
  s.authors           = ['Kris Quigley']
  s.description       = 'Ruby on Rails Talks extension for Refinery CMS'
  s.date              = '2014-11-17'
  s.summary           = 'Talks extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency    'refinerycms-core'
  s.add_dependency    'acts_as_indexed'
  s.add_dependency    'friendly_id'
  s.add_dependency    'globalize'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing'

end
