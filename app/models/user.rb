class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :password_hash, :presence => true
end
