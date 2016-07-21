class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :events

  before_save { |category| category.name = name.downcase }
  validates :name, presence: true, length: { maximum: 140 },uniqueness: { case_sensitive: false }
end
