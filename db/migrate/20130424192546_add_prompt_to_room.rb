class AddPromptToRoom < ActiveRecord::Migration
  def change
    add_column :rooms, :prompt, :text
  end
end
