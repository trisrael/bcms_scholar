class CreateSocialMediaHeaders < ActiveRecord::Migration
  def self.up
    create_content_table :social_media_headers do |t|
      t.string :twitter 
      t.string :facebook 
      t.string :youtube 
      t.text :links 
    end
    
    
    ContentType.create!(:name => "SocialMediaHeader", :group_name => "SocialMediaHeader")
  end

  def self.down
    ContentType.delete_all(['name = ?', 'SocialMediaHeader'])
    CategoryType.all(:conditions => ['name = ?', 'Social Media Header']).each(&:destroy)
    #If you aren't creating a versioned table, be sure to comment this out.
    drop_table :social_media_header_versions
    drop_table :social_media_headers
  end
end
