class RoomUser < ApplicationRecord

  belongs_to :User
  belongs_to :room
end
