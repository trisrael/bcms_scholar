class CreateCarouselPages < ActiveRecord::Migration
  def self.up
    create_content_table :carousel_pages do |t|
      t.string :title 
      t.text :descriptive_content, :size => (64.kilobytes + 1)
      t.text :eyecatcher_content, :size => (64.kilobytes + 1)
      t.references :image_block
      t.string :main_url
      t.string :secondary_url
    end

    ContentType.create!(:name => "CarouselPage", :group_name => "Core")
  end

  def self.down
    ContentType.delete_all(['name = ?', 'CarouselPage'])
    CategoryType.all(:conditions => ['name = ?', 'Carousel Page']).each(&:destroy)
    #If you aren't creating a versioned table, be sure to comment this out.
    drop_table :carousel_page_versions
    drop_table :carousel_pages
  end
end
