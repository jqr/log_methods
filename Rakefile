require 'spec/rake/spectask'

require 'echoe'
Echoe.new 'log_methods' do |p|
  p.description     = "Log methods shows you exactly what arguments a method was called with and what it returned."
  p.url             = "http://github.com/jqr/log_methods"
  p.author          = "Elijah Miller"
  p.email           = "elijah.miller@gmail.com"
  p.retain_gemspec  = true
  p.need_tar_gz     = false
  p.extra_deps      = [
  ]
end

desc 'Default: run specs'
task :default => :spec
Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList["spec/**/*_spec.rb"]
end

task :test => :spec
