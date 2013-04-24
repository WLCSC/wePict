class Group < ActiveRecord::Base
	attr_accessible :name, :auth_attribute, :auth_value
	has_many :memberships, :dependent => :destroy
	has_many :users, :through => :memberships
	has_many :assignments, :as => :assignable

	def display
		self.name
	end
end
