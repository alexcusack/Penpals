require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt
  validates :password_hash, :presence => true
  has_many :notes

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
