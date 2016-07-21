class AddGoingIdToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :going_id, :boolean
  end
end
