class User < ActiveRecord::Base
  has_many :tribes

  has_secure_password
  validates_presence_of :username
  validates_presence_of :email
  validates_presence_of :password

  def self.validate_username(username)
    username.match(/\A\w{1,80}\z/)
  end

  def self.validate_email(email)
    email.match(/\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
  end

end
