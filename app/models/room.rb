class Room < ActiveRecord::Base
  attr_accessible :name, :notes, :user_id, :user_name
	attr_accessor :user_name
	before_create :set_user
	has_many :assignments
	belongs_to :user
	has_many :posts

	def set_user
		self.user = User.where(:name => self.user_name).first
	end

	def display
		self.name
	end

	def users
		ids = []
		self.assignments.each do |a|
			if a.assignable.is_a? User
				ids << a.assignable.id
			elsif a.assignable
				ids += a.assignable.user_ids
			else
			end
		end
		User.where(:id => ids)
	end
end
