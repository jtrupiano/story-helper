#############################
# Rewrites the test tasks to enforce StoryHelper usage
#############################

namespace :db do
  desc "Refresh all the stories"
  task :stories => [:environment, "stories:purge", "stories:load"]
  
  namespace :stories do
    
    desc "Load the stories"
    task :load => [:environment, "seed:load", "data:load"]
    
    desc "Purge the stories"
    task :purge => [:environment, "data:purge", "seed:purge"]
    
    desc "Refresh to seed data"
    task :seed => [:environment, "data:purge", "seed:purge", "seed:load"]
    
    desc "Refresh to test data"
    task :data => [:environment, "data:purge", "data:load"]
  
    namespace :seed do
      desc "Load Seed Data"
      task :load => [:environment] do
        StoryHelper.load_seed
      end
      
      desc "Purge Seed Data"
      task :purge => [:environment] do
        StoryHelper.purge_seed
      end      
    end
    
    namespace :data do
      desc "Load test data"
      task :load => [:environment] do
        StoryHelper.load_data
      end

      desc "Purge test data"
      task :purge => [:environment] do
        StoryHelper.purge_data
      end
    end
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
