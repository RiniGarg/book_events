class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :new_password, 
  :old_password,:admin,:bookings_count

  has_many :bookings,dependent: :destroy
  has_many :events, through: :bookings
  has_secure_password
  before_save { |user| user.email = email.downcase }
  before_create :create_remember_token
  validates :name, presence: true, length:{maximum:50},uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  
  def is_attending?(event_id)
    self.bookings.where(event_id: event_id, going_id: true).present?
  end

  def is_not_attending?(event_id)
    self.bookings.where(event_id: event_id, going_id: false).present?
  end

  def attending_count
    self.bookings.where( going_id: true).count
  end

  def attending_bookings
    self.bookings.where( going_id: true)
  end


  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
