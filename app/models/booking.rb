class Booking < ActiveRecord::Base
  attr_accessible :going_id
    belongs_to :user
   belongs_to :event,counter_cache: true
   validates :user_id, presence: true
   validates :event_id, presence: true
    validates :going_id, presence: true
end
