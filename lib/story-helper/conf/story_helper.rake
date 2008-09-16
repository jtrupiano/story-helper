#############################
# Rewrites the test tasks to enforce StoryHelper usage
#############################

namespace :db do
  desc "Load dev data into the current environment's database."
  task :load_stories => :environment do
    StoryHelper.purge_all_data
    StoryHelper.load_all
  end  
end

# First, delete the Tasks we wish to override
["functionals", "units", "integrations", "all"].each do |tt|
  Rake.application.send(:eval, "@tasks.delete('test:#{tt}')")
end

# Now, override them!
namespace :test do
  Rake::TestTask.new(:units) do |t|
    t.libs << "test"
    t.pattern = 'test/unit/**/*_test.rb'
    t.verbose = true
  end
  Rake::Task['test:units'].comment = "*StoryHelper: Run the unit tests in test/unit.  Your test data MUST be preloaded into the database."

  Rake::TestTask.new(:functionals) do |t|
    t.libs << "test"
    t.pattern = 'test/functional/**/*_test.rb'
    t.verbose = true
  end
  Rake::Task['test:functionals'].comment = "StoryHelper: Run the functional tests in test/functional.  Your test data MUST be preloaded into the database."
  
  Rake::TestTask.new(:integrations) do |t|
    t.libs << "test"
    t.pattern = 'test/integration/**/*_test.rb'
    t.verbose = true
  end
  Rake::Task['test:integrations'].comment = "StoryHelper: Run the integration tests in test/integration.  Your test data MUST be preloaded into the database."
  
  desc "StoryHelper: Run unit and functional tests.  Your test data MUST be preloaded into the database."
  task :all => [:units, :functionals, :integrations]
end