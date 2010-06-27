class CreateStyleSheets < ActiveRecord::Migration
  def self.up
    create_content_table :style_sheets do |t|
      t.text :css_html 
    end
    
    
    ContentType.create!(:name => "StyleSheet", :group_name => "StyleSheet")

  end

  def self.down
    ContentType.delete_all(['name = ?', 'StyleSheet'])
    CategoryType.all(:conditions => ['name = ?', 'Style Sheet']).each(&:destroy)
    ContentTypeGroup.find_by_name('StyleSheet').destroy
    #If you aren't creating a versioned table, be sure to comment this out.
    drop_table :style_sheet_versions
    drop_table :style_sheets
  end
end