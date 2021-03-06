class Room < ActiveRecord::Base
  attr_accessible :name, :notes, :user_id, :user_name, :autoclear, :submittable, :submission_target_id
	attr_accessor :user_name
	before_save :set_user
	has_many :assignments
	belongs_to :user
	has_many :posts
    belongs_to :submission_target, :class_name => "Bank"

	def set_user
		if self.user_name
		self.user = User.where(:name => self.user_name).first
		end
	end

	def display
		((self.open ? '' : '<i class="icon-ban-circle"></i>') + self.name).html_safe
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
