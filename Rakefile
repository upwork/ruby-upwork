%w[rubygems rake rake/clean rake/testtask fileutils].each { |f| require f }
$LOAD_PATH << File.dirname(__FILE__) + '/lib'
require 'bundler/gem_tasks'
require 'oauth'

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/*test_*.rb']
  t.verbose = true
end

task :default => :test
