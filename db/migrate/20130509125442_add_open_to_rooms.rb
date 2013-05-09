class AddOpenToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :open, :boolean
  end
end
