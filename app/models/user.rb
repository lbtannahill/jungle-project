class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true
  validates :email,  uniqueness:  {case_sensitive: false}
  validates :name, presence: true
  validates :password, length: { minimum: 3 }, allow_nil: false
  before_save :to_lower

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end

  private

  def to_lower
    self.email = self.email.downcase
  end
end