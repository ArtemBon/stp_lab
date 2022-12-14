class User < ApplicationRecord
  validates :name, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  
  validates :password, presence: true

  before_create :create_token

  private

  def create_token
    self.token = SecureRandom.urlsafe_base64
  end
end
