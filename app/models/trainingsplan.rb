class Trainingsplan < ActiveRecord::Base
	validates :uebung, presence: true
	validates :saetze, presence: true, numericality: true
	validates :wiederholungen, presence: true, numericality: true
	
end
