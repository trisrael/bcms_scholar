class CreateUpdates < ActiveRecord::Migration
  def self.up
    create_content_table :updates do |t|
    t.references :student
    t.string :update_text
    end
    
    
    ContentType.create!(:name => "Update", :group_name => "People")
  end

  def self.down
    ContentType.delete_all(['name = ?', 'Update'])
    CategoryType.all(:conditions => ['name = ?', 'Update']).each(&:destroy)
    drop_table :updates
  end
end
