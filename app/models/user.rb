require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt
  validates :password_hash, :presence => true
  validates :username, :presence => true
  validates :username, :uniqueness => true
  has_many :notes
  has_one :reciever

  def self.authenticate(username, entered_password)
    user = User.where(username: username).first
    if user && user.password == entered_password
      return user
    else
      return nil
    end
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
