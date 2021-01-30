class Room < ApplicationRecord
  has_many :room_users
  has_manu :rooms, through: :room_users
end
