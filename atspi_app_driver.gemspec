# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = "atspi_app_driver"
  spec.version = "0.7.0"
  spec.authors = ["Matijs van Zuijlen"]
  spec.email = ["matijs@matijs.net"]

  spec.summary = "Test GirFFI-based applications using Atspi"
  spec.homepage = "http://www.github.com/mvz/atspi_app_driver"
  spec.license = "MIT"

  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/mvz/atspi_app_driver"
  spec.metadata["changelog_uri"] = "https://github.com/mvz/atspi_app_driver/blob/master/Changelog.md"

  spec.files = [
    "lib/atspi_app_driver.rb",
    "README.md",
    "Changelog.md",
    "LICENSE.txt"
  ]
  spec.require_paths = ["lib"]

  spec.add_dependency "gir_ffi", "~> 0.15.0"
  spec.add_development_dependency "gir_ffi-gtk", "~> 0.15.0"
  spec.add_development_dependency "minitest", "~> 5.12"
  spec.add_development_dependency "pry", "~> 0.14.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rubocop", "~> 1.22.0"
  spec.add_development_dependency "rubocop-minitest", "~> 0.15.0"
  spec.add_development_dependency "rubocop-packaging", "~> 0.5.0"
  spec.add_development_dependency "rubocop-performance", "~> 1.12.0"
end
