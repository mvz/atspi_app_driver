# frozen_string_literal: true

require "bundler/gem_tasks"
require "rake/clean"
require "rake/manifest/task"
require "rake/testtask"

namespace :test do
  Rake::TestTask.new(:end_to_end) do |t|
    t.libs = ["lib"]
    t.test_files = FileList["test/end_to_end/*_test.rb"]
    t.warning = true
  end

  task all: [:end_to_end]
end

task test: "test:all"

Rake::Manifest::Task.new do |t|
  t.patterns = ["{lib}/**/*", "*.md", "LICENCE.txt"]
end

task default: "test"
