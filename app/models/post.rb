class Post < ActiveRecord::Base
  attr_accessible :data, :room_id, :user_id, :comment
	belongs_to :room
	belongs_to :user
end
