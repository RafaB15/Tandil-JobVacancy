require 'bundler/setup'
require 'bundler'
require 'rake'
require 'padrino-core/cli/rake'

PADRINO_ENV  = ENV['PADRINO_ENV'] ||= ENV['RACK_ENV'] ||= 'test'  unless defined?(PADRINO_ENV)


task :version do
  require './lib/version.rb'
  puts Version.current
  exit 0
end

PadrinoTasks.use(:database)
PadrinoTasks.use(:datamapper)
PadrinoTasks.init

if ['development', 'test', 'travis'].include?(PADRINO_ENV)

  task :all do
  ["rake spec", "rake cucumber"].each do |cmd|
    puts "Starting to run #{cmd}..."
    system("export DISPLAY=:99.0 && bundle exec #{cmd}")
    raise "#{cmd} failed!" unless $?.exitstatus == 0
    end
  end

  task :build_server do
  ["rake spec_report", "rake cucumber_report"].each do |cmd|
    puts "Starting to run #{cmd}..."
    system("export DISPLAY=:99.0 && bundle exec #{cmd}")
    raise "#{cmd} failed!" unless $?.exitstatus == 0
    end
  end

  require 'cucumber/rake/task'
  Cucumber::Rake::Task.new(:cucumber) do |task|
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:seed'].invoke
    task.cucumber_opts = ["features"]
  end

  Cucumber::Rake::Task.new(:cucumber_report) do |task|
    Rake::Task['db:migrate'].invoke
    task.cucumber_opts = ['features', '--format html -o reports/cucumber.html']
  end

  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = "./spec/**/*_spec.rb"
  end

  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec_report) do |t|
    t.pattern = "./spec/**/*_spec.rb"
    t.rspec_opts = %w(--format RspecJunitFormatter --out reports/spec/spec.xml)
  end

=begin  
  require 'rubocop/rake_task'
  desc 'Run RuboCop on the lib directory'
  Rubocop::RakeTask.new(:rubocop) do |task|
    #task.patterns = ['lib/**/*.rb']
    # don't abort rake on failure
    task.fail_on_error = false
  end
=end

  task :default => [:all]

end
