Gem::Specification.new do |s|
  s.name = 'atspi_app_driver'
  s.version = '0.0.3'

  s.summary = 'Test GNOME applications using Atspi'

  s.authors = ['Matijs van Zuijlen']
  s.email = ['matijs@matijs.net']
  s.homepage = 'http://www.github.com/mvz/atspi_app_driver'

  s.files = [
    'lib/atspi_app_driver.rb',
    'README.md',
    'LICENSE',
    'Rakefile',
    'Gemfile'
  ]

  s.add_dependency('gir_ffi', ['>= 0.8.0', '< 0.10.0'])
  s.add_development_dependency('bundler')
  s.add_development_dependency('minitest', ['~> 5.5'])
  s.add_development_dependency('rake', ['~> 10.1'])
  s.add_development_dependency('gir_ffi-gtk', ['>= 0.8.0', '< 0.10.0'])
end
