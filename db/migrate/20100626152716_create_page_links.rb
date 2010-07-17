class CreatePageLinks < ActiveRecord::Migration
  def self.up
    create_content_table :page_links do |t|
      t.string :link_name
      t.string :link_url 
      t.belongs_to :attachment
      t.integer :attachment_version 
      t.integer :position
    end
    
    unless Section.with_path('/top_right_links').exists?
      Section.create!(:name => "PageLink", :parent => Section.system.first, :path => '/page_links', :allow_groups=>:all)
    end
    ContentType.create!(:name => "PageLink", :group_name => "Miscellaneous")
  end

  def self.down
    ContentType.delete_all(['name = ?', 'PageLink'])
    CategoryType.all(:conditions => ['name = ?', 'PageLink']).each(&:destroy)
    #If you aren't creating a versioned table, be sure to comment this out.
    drop_table :page_link_versions
    drop_table :page_links
  end
end
