Cms.attachment_file_permission = 0640

if RAILS_ENV == 'production'  
	# Uploaded files/images will be written out to this directory 
	# instead of the default (tmp/uplaods) directory  
	Attachment.storage_location = File.join(Rails.root, "uploads")
end


Attachment.class_eval do
    def self.remove_unused
        active_attachments = Hash.new

        Attachment.all.each do |attachment|
            value = attachment.file_name
            active_attachments[value] = true
        end
        
        if File.exist?(Attachment.storage_location)
            
        end
        
    end
end
