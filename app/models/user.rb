class User < ActiveRecord::Base
  validates :email, :password, presence: true
  validates :email, uniqueness: true

  def self.login(email, password)
    where(email: email, password: password).first
  end
end
