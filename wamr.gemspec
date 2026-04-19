Gem::Specification.new do |spec|
  spec.name          = "wamr"
  spec.version       = "0.1.0"
  spec.authors       = ["ngonzalez"]
  spec.email         = ["ngonzalez@gmail.com"]

  spec.summary       = "Scan for Git repositories"
  spec.description   = "A quick tool to find projects that used Git that may be tucked away."
  spec.homepage      = "https://github.com/SHAPeS-Software/wamr"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*", "bin/*", "README.md"]
  spec.bindir        = "bin"
  spec.executables   = ["wamr"]
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 4.0.2"

  spec.add_dependency "shellwords"
  spec.add_development_dependency "rbs", "~> 3.6"
  spec.add_development_dependency "solargraph"
end
