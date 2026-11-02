require_relative "lib/paysafe/version"

Gem::Specification.new do |spec|
  spec.name = "paysafe"
  spec.version = Paysafe::VERSION
  spec.authors = ["Javier Julio"]
  spec.email = ["jjfutbol@gmail.com"]

  spec.summary = "A Ruby interface to the Paysafe REST API."
  spec.description = "A Ruby interface to the Paysafe REST API."
  spec.homepage = "https://github.com/javierjulio/paysafe"
  spec.license = "MIT"

  spec.files = Dir["README.md", "LICENSE*", "lib/**/*.rb"]
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 3.3'

  spec.add_dependency "http", '>= 4', '< 7'
end
