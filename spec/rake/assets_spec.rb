require "rake"
require "../factories.rb"

describe "assets rake tasks" do
   
  before :all do
    Attachment.storage_location = Rails.root + "/tmp/test_uploads"
  end
  
  after :all do
      FileUtils.rm_rf File.new(Attachment.storage_location)
      Attachment.storage_location = null;
  end
    
  before do
    @rake = Rake::Application.new
    Rake.application = @rake
    load '../../lib/tasks/rake/assets.rake'
  end

  describe "rake images:remove_unused" do
      
    def setup_scenario
     @attachment = Factory.build(:attachment)
    image = Factory.build(:image_block)
    image.attachment = @attachment
    
    #attachment unattached to any image_blocks
    @attachment2 = Factory.build(:attachment)
    file = File.new(Attachment.storage_location + "/" + 10.times.map { rand(9)}.to_s)
    end
    
    before do
      @task_name = "images:remove_unused"
      setup_scenario      
      @rake[@task_name]
    end
    
    
    
    it "should not remove directories" do
        
    end
    
    it "should remove unused attachments" do
        
    end
    
    it "should not remove used attachments" do
    end
    
  end
end