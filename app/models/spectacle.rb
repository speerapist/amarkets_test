class Spectacle < ApplicationRecord
	validates :name, :start_date, :end_date, presence: true
	validates_with SpectacleDateValidator
end
