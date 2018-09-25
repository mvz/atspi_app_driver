# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = 'atspi_app_driver'
  s.version = '0.4.0'

  s.summary = 'Test GirFFI-based applications using Atspi'
  s.required_ruby_version = '>= 2.2.0'

  s.authors = ['Matijs van Zuijlen']
  s.email = ['matijs@matijs.net']
  s.homepage = 'http://www.github.com/mvz/atspi_app_driver'

  s.files = [
    'lib/atspi_app_driver.rb',
    'README.md',
    'Changelog.md',
    'LICENSE',
    'Rakefile',
    'Gemfile'
  ]

  s.add_dependency('gir_ffi', ['~> 0.14.0'])
  s.add_development_dependency('bundler')
  s.add_development_dependency('gir_ffi-gtk', ['~> 0.13.0'])
  s.add_development_dependency('minitest', ['~> 5.5'])
  s.add_development_dependency('rake', ['~> 12.0'])
end
