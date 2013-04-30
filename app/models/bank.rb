class Bank < ActiveRecord::Base
  attr_accessible :name, :notes, :room_id
	has_many :questions
	belongs_to :room
end
