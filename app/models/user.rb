class User < ActiveRecord::Base
  has_secure_password

  has_many :reviews

  validates :name, presence: true
  validates :password, presence: true
  validates :email, presence: true, :uniqueness => {:scope => :name}
end
