# frozen_string_literal: true

require_relative "lib/atspi_app_driver/version"

Gem::Specification.new do |spec|
  spec.name = "atspi_app_driver"
  spec.version = AtspiAppDriver::VERSION
  spec.authors = ["Matijs van Zuijlen"]
  spec.email = ["matijs@matijs.net"]

  spec.summary = "Test GirFFI-based applications using Atspi"
  spec.homepage = "http://www.github.com/mvz/atspi_app_driver"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/mvz/atspi_app_driver"
  spec.metadata["changelog_uri"] = "https://github.com/mvz/atspi_app_driver/blob/master/Changelog.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = File.read("Manifest.txt").split
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "gir_ffi", "~> 0.16.0"

  spec.add_development_dependency "gir_ffi-gtk", "~> 0.16.0"
  spec.add_development_dependency "minitest", "~> 5.12"
  spec.add_development_dependency "pry", "~> 0.14.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rake-manifest", "~> 0.2.0"
  spec.add_development_dependency "rubocop", "~> 1.25"
  spec.add_development_dependency "rubocop-minitest", "~> 0.29.0"
  spec.add_development_dependency "rubocop-packaging", "~> 0.5.0"
  spec.add_development_dependency "rubocop-performance", "~> 1.13"
end
