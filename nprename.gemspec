Gem::Specification.new do |s|
  s.name = "nprename"
  s.version = "1.0.1"
  s.summary = "Noun Project file renamer"
  s.description = "creates a usable filename from a Noun Project ID"
  s.authors = ["Kevin Ernst"]
  s.email = "ernstki@mail.uc.edu"
  s.homepage = "https://github.com/ernstki/nprename"
  s.license = "MIT"
  s.executables = ["nprename"]
  s.required_ruby_version = "~> 2.3"
  s.add_runtime_dependency "noun-project-api",
    ["~> 3.1"]
  s.add_runtime_dependency "activesupport",
    ["~> 5"]
end
