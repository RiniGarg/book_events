class AddEndDateTimeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :end_date_time, :datetime
  end
end
