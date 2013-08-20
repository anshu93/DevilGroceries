class Faq < ActiveRecord::Base
	attr_accessible :question, :answer
	validates :question, :answer, presence: true
end
