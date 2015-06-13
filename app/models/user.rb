# require 'BCrypt'
class User < ActiveRecord::Base
  # include BCrypt
  # Remember to create a migration!
  validates :password_hash, :presence => true

  has_many :notes

  # def password
  #   @password ||= Password.new(password_hash)
  # end

  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.password_hash = @password
  # end


end
