class Note < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user

  validates :message, :presence => true
  validates :user_id, :presence => true
end
