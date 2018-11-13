
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "kumolus/paranoia/version"

Gem::Specification.new do |spec|
  spec.name          = "kumolus-paranoia"
  spec.version       = Kumolus::Paranoia::VERSION
  spec.authors       = ["kumoas"]
  spec.email         = ["kumoas@kumolus.com"]

  spec.summary       = "This gem is use for soft delete of active record object"
  spec.description   = <<-DSC
    You would use this Paranoia gem if you
    wished that when you called destroy on an Active Record object that it
    didn't actually destroy it, but just "hide" the record. Paranoia does this
    by setting a deleted_at field to the current time when you destroy a record,
    and hides it by scoping all queries on your model to only include records
    which do not have a deleted_at field.
  DSC
  spec.homepage      = "https://github.com/kumoas/kumolus-paranoia"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org/"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.required_rubygems_version = ">= 1.3.6"

  spec.required_ruby_version = '>= 2.0'
  spec.add_dependency 'activerecord', '>= 4.0', '>= 5.1'

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.require_path = 'lib'
end
