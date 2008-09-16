Gem::Specification.new do |s|
  s.name = %q{story-helper}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["John Trupiano"]
  s.date = %q{2008-09-16}
  s.default_executable = %q{storify}
  s.description = %q{A set of helpers/features to aid in implementing the StoryHelper concept in rails apps}
  s.email = ["jtrupiano@gmail.com"]
  s.executables = ["storify"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "Manifest.txt", "README.txt", "Rakefile", "bin/storify", "lib/story-helper.rb", "lib/story-helper/conf/story_accessors.rb", "lib/story-helper/conf/story_helper.rake", "lib/story-helper/conf/story_helper.rb", "lib/story-helper/version.rb", "story-helper.gemspec", "test/rails_version_test.rb", "test/test_story_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/jtrupiano/story-helper}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{johntrupiano}
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{A set of helpers/features to aid in implementing the StoryHelper concept in rails apps}
  s.test_files = ["test/test_story_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
      s.add_development_dependency(%q<hoe>, [">= 1.7.0"])
    else
      s.add_dependency(%q<hoe>, [">= 1.7.0"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 1.7.0"])
  end
end
