Gem::Specification.new do |s|
  s.name = "twithub"
  s.version = "0.1.0"
  s.authors = ["Peter Zimbelman"]
  s.email = ["pzimbelman@gmail.com"]
  s.homepage = ""
  s.summary = %q{A gem to aggregate your recent twitter and github activity}
  s.description = %q{A gem to aggregate your recent twitter and github activity into a single feed. Can accept multiple logins for either service.}

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_development_dependency "rake"
end
