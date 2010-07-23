class CreateImportantInfos < ActiveRecord::Migration
  def self.up
    create_content_table :important_infos do |t|
      t.text :text, :size => (64.kilobytes + 1) 
      t.string :url
      t.string :title
    end
    
    
    ContentType.create!(:name => "ImportantInfo", :group_name => "Singletons")
  end

  def self.down
    ContentType.delete_all(['name = ?', 'ImportantInfo'])
    CategoryType.all(:conditions => ['name = ?', 'Important Info']).each(&:destroy)
    #If you aren't creating a versioned table, be sure to comment this out.
    drop_table :important_info_versions
    drop_table :important_infos
  end
end
