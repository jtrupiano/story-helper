# Exposes methods that create dev and test data. Loads things from a "user story"
# perspective.
class StoryHelper
  self.extend StoryAccessors::Methods

  def self.load_all
    # Load data via Ruby -- your models are accessible here, so use those functions to create complex data!
  
  end
  
  # 
  def self.purge_all_data
    # Manually delete from all models and non-model join tables
    
  end
  
end