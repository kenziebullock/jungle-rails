class User < ActiveRecord::Base
  has_secure_password

  has_many :reviews

  validates :name, presence: true
  validates :password, presence: true
  validates_length_of :password, minimum: 6
  validates :email, presence: true, uniqueness: { scope: [:name], case_sensitive: false }

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
