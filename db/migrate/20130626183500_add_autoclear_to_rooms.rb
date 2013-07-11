class AddAutoclearToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :autoclear, :boolean
  end
end
