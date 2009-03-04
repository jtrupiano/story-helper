# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{story-helper}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["John Trupiano"]
  s.date = %q{2009-03-04}
  s.default_executable = %q{storify}
  s.description = %q{A set of helpers/features to aid in implementing the StoryHelper concept in rails apps}
  s.email = ["jtrupiano@gmail.com"]
  s.executables = ["storify"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt"]
  s.files = ["History.txt", "Manifest.txt", "README.textile", "Rakefile", "bin/storify", "lib/story-helper.rb", "lib/story-helper/conf/story_accessors.rb", "lib/story-helper/conf/story_helper.rake", "lib/story-helper/conf/story_helper.rb", "lib/story-helper/conf/test_helper_extensions.rb", "lib/story-helper/version.rb", "story-helper.gemspec", "test/rails_version_test.rb", "test/test_story_helper.rb"]
  s.has_rdoc = true
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{johntrupiano}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A set of helpers/features to aid in implementing the StoryHelper concept in rails apps}
  s.test_files = ["test/test_story_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe>, [">= 1.8.2"])
    else
      s.add_dependency(%q<hoe>, [">= 1.8.2"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 1.8.2"])
  end
end
