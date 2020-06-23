require "bundler/gem_tasks"
require 'rspec/core/rake_task'

desc 'Run spec tests'
task :spec do
  RSpec::Core::RakeTask.new do |spec|
    spec.pattern = "./spec/**/*_spec.rb"
  end
end

task :default => :spec
