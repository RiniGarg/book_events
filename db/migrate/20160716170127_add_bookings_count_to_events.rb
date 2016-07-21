class AddBookingsCountToEvents < ActiveRecord::Migration
  def change
    add_column :events, :bookings_count, :integer
  end
end
