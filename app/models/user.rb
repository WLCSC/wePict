class User < ActiveRecord::Base
	validates :username, :presence => true
	attr_accessor :password
	attr_accessible :name, :email_address, :administrator
	before_save :encrypt_password
	has_many :memberships
	has_many :groups, :through => :memberships
	has_many :assignments, :as => :assignable
	has_many :posts
	has_many :rooms, :through => :posts

	def encrypt_password
		if password
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
		end
	end

	def admin?
		self.administrator
	end

	def belongs_to? group
		group.users.include? self
	end

	def display 
		self.name
	end
end
