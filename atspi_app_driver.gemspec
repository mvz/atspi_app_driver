Gem::Specification.new do |s|
  s.name = 'atspi_app_driver'
  s.version = '0.1.0'

  s.summary = 'Test GNOME applications using Atspi'

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

  s.add_dependency('gobject-introspection', ['~> 3.1.1'])
  s.add_development_dependency('bundler')
  s.add_development_dependency('gtk3', ['~> 3.1.1'])
  s.add_development_dependency('minitest', ['~> 5.5'])
  s.add_development_dependency('rake', ['~> 12.0'])
end
