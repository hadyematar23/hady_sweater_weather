class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password

  has_secure_password

  before_create :generate_api_key
  private 

  def generate_api_key
    loop do
      self.api_key = SecureRandom.hex(16)
      break unless User.exists?(api_key: api_key)
    end
  end
end