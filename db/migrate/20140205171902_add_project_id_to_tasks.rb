class AddProjectIdToTasks < ActiveRecord::Migration
	def change
		add_column :trainingsplans, :project_id, :integer
		add_index :trainingsplans, :project_id
	end
end
