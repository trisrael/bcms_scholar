class CreateBios < ActiveRecord::Migration
  def self.up
    create_content_table :bios do |t|
      t.string :first_name 
      t.string :last_name 
      t.belongs_to :attachment
      t.integer :attachment_version 
      t.text :description, :size => (64.kilobytes + 1) 
      t.string :website 
    end
    
    unless Section.with_path('/bios').exists?
      Section.create!(:name => "Bio", :parent => Section.system.first, :path => '/bios', :allow_groups=>:all)
    end
    ContentType.create!(:name => "Bio", :group_name => "People")
  end

  def self.down
    ContentType.delete_all(['name = ?', 'Bio'])
    CategoryType.all(:conditions => ['name = ?', 'Bio']).each(&:destroy)
    #If you aren't creating a versioned table, be sure to comment this out.
    drop_table :bio_versions
    drop_table :bios
  end
end
