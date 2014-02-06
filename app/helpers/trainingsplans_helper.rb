module TrainingsplansHelper

	def belongs_trainingsplan_to_current_user (trainingsplan_user_id)
		if current_user
			if trainingsplan_user_id == current_user.id
					true
				else
					false
				end 
			end
		end 
end
