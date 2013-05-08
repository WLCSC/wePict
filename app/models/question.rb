class Question < ActiveRecord::Base
  attr_accessible :bank_id, :content, :sequence, :notes
	belongs_to :bank
	validates :sequence, :content, :presence => true
end
