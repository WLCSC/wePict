class Assignment < ActiveRecord::Base
	belongs_to :assignable, :polymorphic => true
	belongs_to :room
	attr_accessible :user_name, :group_name

	attr_accessor :user_name, :group_name
	before_create :find_principal

	def find_principal
		if self.user_name != ""
			self.assignable = User.where(:name => self.user_name).first
			return true
		end
		if self.group_name != ""
			self.assignable = Group.where(:name => self.group_name).first
			return true
		end
		nil
	end

end
