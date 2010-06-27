class Bio < ActiveRecord::Base
  acts_as_content_block :belongs_to_attachment => true
  validates_presence_of :first_name, :last_name
  has_many :bio_updates
        
        def set_attachment_file_path
    	  super
        end

        def set_attachment_section
          # The default behavior is to put all attachments in the root section
          # Override this method if you would like to change that
          super
        end

	def name
	  first_name + ' ' + last_name
	end

end
