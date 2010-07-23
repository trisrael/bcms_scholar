class MaintainUniquePositions
	#TODO: Move this logic to a rake task/job (Ensure position integrity)
	#For ActiveRecord classes with a position attribute, when a position is updated or added;
	#we want to ensure that the rest of the positions of other models have valid positions with no duplicates

	def self.before_create(model)
	    ensure_unique_model_positions(model)
 	end

	def self.before_update(model)
	    ensure_unique_model_positions(model)
	end

	def self.ensure_unique_model_positions(model)
          sorted_models = get_sorted_models_by_position(model.class)
          num_to_check = model.position
	  sorted_models.each do |model|
	    if(model.position == num_to_check)
	      num_to_check++ #Update the model with one position added to it
	      model.position = num_to_check
	    end
	  end	
        end

        def self.get_sorted_models_by_position(model_class)
          return model_class.all.sort{|a,b| a.position <=> b.position}
	end

end
