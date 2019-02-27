# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "fuse_shift_tools"
  s.version = "1.0.0"

  s.require_paths = ["lib"]
  s.authors = ["Jascha, Astrid"]
  s.date = "2018-07-30"
  s.description = ""
  s.email = "magicjascha@riseup.net"
  s.homepage = "https://github.com/magicjascha/fuse_shift_tools"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0")
  s.requirements = ["none"]
  s.summary = ""
  s.files = ["lib/fuse_shift_tools/data_manipulation.rb"]
  s.executables = ["download", "fakedata", "send_deadline_warning"]

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<faker>, ["~> 1.9"])
    else
      s.add_dependency(%q<faker>, ["~> 1.9"])
    end
  else
    s.add_dependency(%q<faker>, ["~> 1.9"])
  end
end
