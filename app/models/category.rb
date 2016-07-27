class Category < ActiveRecord::Base
  attr_accessible :name,:description
  has_many :events
  validates :name, presence: true, length: { maximum: 140 },uniqueness: { case_sensitive: false }
  validates :description, presence: true
end
