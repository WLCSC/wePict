class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :bank_id
      t.string :content
			t.integer :sequence

      t.timestamps
    end
  end
end
