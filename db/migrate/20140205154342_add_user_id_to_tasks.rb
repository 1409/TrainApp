class AddUserIdToTasks < ActiveRecord::Migration
	def change
		add_column :trainingsplans, :user_id, :integer
		add_index :trainingsplans, :user_id
	end
end