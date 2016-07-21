class RemoveBookingIdFromEvents < ActiveRecord::Migration
  def up
    remove_column :events, :booking_id
  end

  def down
    add_column :events, :booking_id, :integer
  end
end
