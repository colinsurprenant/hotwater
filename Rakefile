require 'bundler/setup'
require 'rake'
require 'rake/clean'
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'ffi-compiler/compile_task'

task :default => [:clean, :compile, :spec]

desc "run specs"
task :spec do
  RSpec::Core::RakeTask.new
end

desc "compiler tasks"
namespace "ffi-compiler" do
  FFI::Compiler::CompileTask.new('ext/hotwater/hotwater') do |c|
  end
end
task :compile => ["ffi-compiler:default"]

CLEAN.include('ext/**/*{.o,.log,.so,.bundle}')
CLEAN.include('lib/**/*{.o,.log,.so,.bundle}')
CLEAN.include('ext/**/Makefile')

