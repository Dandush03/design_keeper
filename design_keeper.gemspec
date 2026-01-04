require_relative "lib/design_keeper/version"

Gem::Specification.new do |spec|
  spec.name        = "design_keeper"
  spec.version     = DesignKeeper::VERSION
  spec.authors     = [ "Daniel Laloush" ]
  spec.email       = [ "d.laloush@outlook.com" ]
  spec.homepage    = "TODO"
  spec.summary     = "TODO: Summary of DesignKeeper."
  spec.description = "TODO: Description of DesignKeeper."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 8.1.1"
  spec.add_dependency "lookbook", "~> 2.3"
  spec.add_dependency "tailwindcss-rails", ">= 4.0"
  spec.add_dependency "view_component", "~> 4.1"
  spec.add_dependency "importmap-rails", "~> 2.2"
  spec.add_dependency "turbo-rails", "~> 2.0"
  spec.add_dependency "stimulus-rails", "~> 1.3"
end
