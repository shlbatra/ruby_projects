Gem::Specification.new do |spec|
  spec.name        = "studio_game_sb"
  spec.version     = "3.0.0"
  spec.author      = "SB"
  spec.email       = "sb@gmail.com"
  spec.summary     = "A command line, randomized studio game application"
  spec.homepage    = ""
  spec.license     = "MIT"

  spec.files       = Dir["{bin,lib}/**/*"] + %w[README.md]
  spec.executables = ["studio_game"]

  spec.required_ruby_version = ">= 3.2.0"
end