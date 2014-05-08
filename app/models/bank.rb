class Bank < ActiveRecord::Base
  attr_accessible :name, :notes, :room_id
	has_many :questions, :dependent => :destroy
	belongs_to :user

	def copy target
		bank = self.dup
		bank.user_id = target.id
		if bank.save
		self.questions.each do |q|
			q2 = q.dup
			q2.bank_id = bank.id
			q2.save
		end
		true
		else
			false
		end
	end
end
