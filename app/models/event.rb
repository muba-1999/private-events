class Event < ApplicationRecord
    validates :name, presence: true
	validates :description, :date, :location, presence: true

	has_many :attendances
	has_many :attendees, through: :attendances, source: :user
	belongs_to :creator, class_name: "User"

	scope :past, -> { where('date < ?', Date.today) }
	scope :upcoming, -> { where('date >= ?', Date.today) }
end
