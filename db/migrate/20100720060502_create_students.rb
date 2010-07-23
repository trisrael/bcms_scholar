class CreateStudents < ActiveRecord::Migration
  def self.up
    create_content_table :students do |t|
      t.string :first_name 
      t.string :last_name 
      t.text :description, :size => (64.kilobytes + 1) 
      t.string :website
      t.text :description, :size => (64.kilobytes + 1)
    end
    
    
    ContentType.create!(:name => "Student", :group_name => "People")
  end

  def self.down
    ContentType.delete_all(['name = ?', 'Student'])
    CategoryType.all(:conditions => ['name = ?', 'Student']).each(&:destroy)
    #If you aren't creating a versioned table, be sure to comment this out.
    drop_table :student_versions
    drop_table :students
  end
end
