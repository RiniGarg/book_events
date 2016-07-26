class Event < ActiveRecord::Base
  attr_accessible :name, :description, :venue, :start_date_time,:end_date_time,:category_id

  
  belongs_to :category

	has_many :bookings,dependent: :destroy
	has_many :users, through: :bookings
	
  #before_save { |event| event.name = name.downcase }
  validates :category_id, presence: true
  validates :description, presence: true, length: { maximum: 140 }
  validates :venue, presence: true, length: { maximum: 140 }
  validates :start_date_time,presence: true
  validates :end_date_time,presence:true
  validates :name,presence: true, length: { maximum: 140 },uniqueness: { case_sensitive: false }
 default_scope order:'bookings_count DESC'

end
