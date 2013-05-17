class ChangeContentToTextInQuestions < ActiveRecord::Migration
	def change
		change_column :questions, :content, :text, :limit => nil
	end
end
