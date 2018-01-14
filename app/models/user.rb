class User < ApplicationRecord
  has_secure_password
  has_many :events, foreign_key: 'creator_id'
  has_many :attendances, foreign_key: :attendee_id
  has_many :attended_events, through: :attendances

  validates %i[name email], presence: true
end
