

module TagAdditions
 def self.included(base)
  base.extend(Taggable)  
 end

 module Taggable 
  def can_tag 
 named_scope :with_tag, lambda{|t| 
 #TODO: be defensive against incorrect usages
 tag_list = t.is_a?(Array) ? t : [t]
 tags_mapped = tag_list.map { |tag| sanitize_sql(["tags.name LIKE ?", tag])}

 tags_conditions = tags_mapped.size == 1 ? tags_mapped.first : tags_mapped.join(" OR ")
 {:conditions => "#{table_name}.#{primary_key} IN (SELECT taggings.taggable_id	FROM taggings JOIN tags ON   
 taggings.tag_id = tags.id AND (#{tags_conditions}))" }}
 end
 end
end

ActiveRecord::Base.send(:include, TagAdditions)
AbstractFileBlock.send(:can_tag)
Student.send(:can_tag)
ImportantInfo.send(:can_tag)




