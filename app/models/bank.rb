class Bank < ActiveRecord::Base
  attr_accessible :name, :notes, :room_id
	has_many :questions
	belongs_to :room

	def copy target
		bank = Bank.new(self.attributes.merge(:room_id => target.id))
		if bank.save
		self.questions.each do |q|
			Question.create(q.attributes.merge(:bank_id => bank.id))
		end
		end
		redirect_to [target, bank], :notice => "Successfully copied question bank."
	end
end
