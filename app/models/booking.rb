class Booking < ActiveRecord::Base
  attr_accessible :going_id
    belongs_to :user
   belongs_to :event
   validates :user_id, presence: true
   validates :event_id, presence: true
    validates :going_id, presence: true

    def after_save
      self.update_counter_cache
    end

  def after_destroy
    self.update_counter_cache
  end


def update_counter_cache
  
  self.event.bookings_count = Booking.where({:going_id => true, :event_id =>self.event_id }).count
  self.event.save!
end

end
