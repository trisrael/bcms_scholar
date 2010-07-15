class CreateFacultyBios < ActiveRecord::Migration
  def self.up
    create_content_table :faculty_bios do |t|
      t.string :first_name 
      t.string :last_name 
      t.belongs_to :attachment
      t.integer :attachment_version 
      t.text :description, :size => (64.kilobytes + 1) 
      t.string :website 
    end
    
    unless Section.with_path('/faculty_bios').exists?
      Section.create!(:name => "FacultyBio", :parent => Section.system.first, :path => '/faculty_bios', :allow_groups=>:all)
    end
    ContentType.create!(:name => "FacultyBio", :group_name => "People")
  end

  def self.down
    ContentType.delete_all(['name = ?', 'FacultyBio'])
    Section.delete_all(['name = ?', 'FacultyBio'])
    #If you aren't creating a versioned table, be sure to comment this out.
    drop_table :faculty_bio_versions
    drop_table :faculty_bios
  end
end
