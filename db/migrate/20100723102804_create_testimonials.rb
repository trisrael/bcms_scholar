class CreateTestimonials < ActiveRecord::Migration
  def self.up
    create_content_table :testimonials do |t|
      t.text :text 
      t.string :name 
      t.string :title 
    end
    
    
    ContentType.create!(:name => "Testimonial", :group_name => "Core")
  end

  def self.down
    ContentType.delete_all(['name = ?', 'Testimonial'])
    CategoryType.all(:conditions => ['name = ?', 'Testimonial']).each(&:destroy)
    #If you aren't creating a versioned table, be sure to comment this out.
    drop_table :testimonial_versions
    drop_table :testimonials
  end
end
