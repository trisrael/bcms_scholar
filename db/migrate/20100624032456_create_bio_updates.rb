class CreateBioUpdates < ActiveRecord::Migration
  def self.up
    create_content_table :bio_updates do |t|
      t.date :date_entered 
      t.text :update_text 
      t.references :person
      t.string :type
    end
    
    
    ContentType.create!(:name => "BioUpdate", :group_name => "People")
  end

  def self.down
    ContentType.delete_all(['name = ?', 'BioUpdate'])
    
    #If you aren't creating a versioned table, be sure to comment this out.
    drop_table :bio_update_versions
    drop_table :bio_updates
  end
end
