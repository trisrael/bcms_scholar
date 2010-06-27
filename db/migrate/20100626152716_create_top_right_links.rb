class CreateTopRightLinks < ActiveRecord::Migration
  def self.up
    create_content_table :top_right_links do |t|
      t.url :string 
      t.belongs_to :attachment
      t.integer :attachment_version 
    end
    
    unless Section.with_path('/top_right_links').exists?
      Section.create!(:name => "Top Right Link", :parent => Section.system.first, :path => '/top_right_links', :allow_groups=>:all)
    end
    ContentType.create!(:name => "TopRightLink", :group_name => "TopRightLink")
  end

  def self.down
    ContentType.delete_all(['name = ?', 'TopRightLink'])
    CategoryType.all(:conditions => ['name = ?', 'Top Right Link']).each(&:destroy)
    #If you aren't creating a versioned table, be sure to comment this out.
    drop_table :top_right_link_versions
    drop_table :top_right_links
  end
end
