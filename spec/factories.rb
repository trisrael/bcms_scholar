Factory.define :attachment do |a|
        dir = File.directory?(Attachment.storage_location) ? Attachment.storage_location : Dir.mktmpdir
        name = 10.times.map{rand(9)}.to_s
        file_path = dir + "/" + name
        file = File.new(file_path, "w+")
        section_id = rand(9)
        a.file_location file_path
        a.section_id section_id
        a.file_path section_id.to_s + "/" + 10.times.map{rand(9)}.to_s
end

Factory.define :image_block do |img|
        img.name 7.times.map{rand(150).chr}.to_s
end

Factory.define :user do |user|
        name = 7.times.map{rand(150).chr}.to_s
        user.login name 
        user.email  name + "@website.com"
end