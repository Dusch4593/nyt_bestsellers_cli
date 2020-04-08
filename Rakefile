# require "bundler/gem_tasks"
# require "rspec/core/rake_task"
require 'pry'

# RSpec::Core::RakeTask.new(:spec)
task :environment do
  require_relative "./config/nyt_bestsellers_cli.rb"
end

task :default => :spec

task :console => :environment do
  Pry.start
end
