class AddSubmissionTargetIdToRoom < ActiveRecord::Migration
  def change
    add_column :rooms, :submission_target_id, :integer
    add_column :rooms, :submittable, :boolean
  end
end
