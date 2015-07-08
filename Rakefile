require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new("spec") do |t|
  t.test_files = FileList["spec/**/*_spec.rb"]
end

Rake::TestTask.new("doctest") do
  require "minitest/doctest"
  require "minitest/autorun"
  Minitest::Doctest.run("spec/calculator.rb")
end

task :test => [:spec, :doctest]
