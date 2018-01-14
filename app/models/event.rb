class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id
  has_many :attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :attendances

  scope :soonest, -> { order('datetime - CURRENT_TIMESTAMP ASC') }
  scope :most_recent, -> { order('CURRENT_TIMESTAMP - datetime ASC') }

  scope :upcoming, -> { where('datetime > CURRENT_TIMESTAMP').soonest }
  scope :past, -> { where('datetime < CURRENT_TIMESTAMP').most_recent }

  validates %i[name location datetime description], presence: true
end
