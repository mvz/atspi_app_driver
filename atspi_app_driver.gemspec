Gem::Specification.new do |s|
  s.name = 'atspi_app_driver'
  s.version = '0.0.1'

  s.summary = 'Test GNOME applications using Atspi'

  s.authors = ['Matijs van Zuijlen']
  s.email = ['matijs@matijs.net']
  s.homepage = 'http://www.github.com/mvz/atspi_app_driver'

  s.files =
    Dir['lib/**/*.rb', '*.md', 'LICENSE', 'gems.rb'] &
    `git ls-files -z`.split('\0')

  s.add_dependency('gir_ffi', ['~> 0.7.9'])
  s.add_development_dependency('bundler', ['~> 1.9'])
end

