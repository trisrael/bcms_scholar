require 'spec_helper'
require File.join(Rails.root, "spec", "/factories.rb")
require 'tmpdir'

describe Attachment do
    before(:each) do
        storage_directory = Dir.mktmpdir
        Attachment.storage_location = storage_directory
        User.stub!(:current).and_return(Factory.build(:user)) 
        setup_scenario    
        attachments_created?    
    end
    
    def setup_scenario
        @attachment = Factory.build(:attachment)
        image = Factory.build(:image_block)
        debugger
        image.save(false)
        image.attachment = @attachment
        #attachment unattached to any image_blocks
        @unused_attachment = Factory.build(:attachment)
        @unused_attachment.save(false)
    end
    
    
    after(:each) do
        FileUtils.rm_rf Attachment.storage_location
        Attachment.storage_location = nil
    end
    
    def attachments_created?
        Attachment.find_by_name(@attachment.name).should == @attachment
        Attachment.find_by_name(@unused_attachment.name).should == @unused_attachment
    end
    
    it "should not remove directories" do
        #add dir
        dir_path = Attachment.storage_location + "/dir"
        Dir.mkdir(dir_path)
        Attachment.remove_unused
        #ensure directory not delete
        File.exist?(dir_path).should == true
    end
    
    it "should remove unused attachments" do
        attach_name = @unused_attachment.name
        Attachment.remove_unused
    end
    
    it "should not remove used attachments" do
        Attachment.remove_unused
    end

end

