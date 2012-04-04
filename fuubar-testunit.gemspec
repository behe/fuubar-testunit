# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = "fuubar-testunit"
  s.version     = '0.1'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Johan Lind"]
  s.email       = ["johan@adptiv.se"]
  s.homepage    = "https://github.com/behe/fuubar-testunit"
  s.summary     = %q{the instafailing Test::Unit progress bar formatter}
  s.description = %q{the instafailing Test::Unit progress bar formatter}

  s.rubyforge_project = "fuubar-testunit"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # s.add_dependency('rspec', ["~> 2.0"])
  s.add_dependency('ruby-progressbar', ["~> 0.0.10"])
  # s.add_dependency('rspec-instafail', ["~> 0.2.0"])
end