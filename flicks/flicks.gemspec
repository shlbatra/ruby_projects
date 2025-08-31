Gem::Specification.new do |spec|
  spec.name        = "flicks_sb"
  spec.version     = "1.0.0"
  spec.author      = "SB"
  spec.email       = "sb@gmail.com"
  spec.summary     = "A command line, randomized movie ranking application"
  spec.homepage    = ""
  spec.license     = "MIT"

  spec.files       = Dir["{bin,lib}/**/*"] + %w[README.md]
  spec.executables = ["flicks"]

  spec.required_ruby_version = ">= 3.2.0"
end