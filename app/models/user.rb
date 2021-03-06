require 'bcrypt'
class User < ActiveRecord::Base
	validates :username, :presence => true
	validates :password, :confirmation => true
	validate :internal_user_cannot_have_password
	attr_accessor :password, :password_confirmation
	attr_accessible :name, :email_address, :administrator, :username, :password, :password_confirmation, :internal
	before_save :encrypt_password
	has_many :memberships
	has_many :groups, :through => :memberships
	has_many :assignments, :as => :assignable
	has_many :posts
	has_many :rooms, :through => :posts
	has_many :managed_rooms, :class_name => "Room"
	has_many :banks

	def internal_user_cannot_have_password
		if password && !internal
			errors.add(:base, "An LDAP user can't have a password in the database")
		end
	end

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

	def rooms
		Room.all.keep_if{|r| r.users.include? self}
	end
end
