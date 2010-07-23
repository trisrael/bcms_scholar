class AddStudentImageReferences < ActiveRecord::Migration
  def self.up
    add_column :students, :headshot, :string
    add_column :students, :thumbnail, :string
    add_column :students, :tabs_published, :text	    
  end

  def self.down
    remove_column :students, :headshot
    remove_column :students, :thumbnail
    remove_column :students, :tabs_published
  end
end
