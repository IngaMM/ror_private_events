class Event < ApplicationRecord
  has_many :event_attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendances
  belongs_to :creator, class_name: "User"
  scope :previous, -> { where("date < ?", Time.now) }
  scope :upcoming, -> { where("date >= ?", Time.now) }
end
