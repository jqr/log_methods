# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{log_methods}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Elijah Miller"]
  s.date = %q{2009-02-02}
  s.description = %q{Log methods shows you exactly what arguments a method was called with and what it returned.}
  s.email = %q{elijah.miller@gmail.com}
  s.extra_rdoc_files = ["CHANGELOG", "lib/log_methods.rb", "LICENSE", "README.rdoc"]
  s.files = ["CHANGELOG", "init.rb", "install.rb", "lib/log_methods.rb", "LICENSE", "log_methods.gemspec", "Manifest", "Rakefile", "README.rdoc", "uninstall.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/jqr/log_methods}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Log_methods", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{log_methods}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Log methods shows you exactly what arguments a method was called with and what it returned.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<echoe>, [">= 0"])
    else
      s.add_dependency(%q<echoe>, [">= 0"])
    end
  else
    s.add_dependency(%q<echoe>, [">= 0"])
  end
end
