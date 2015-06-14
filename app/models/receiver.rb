class Receiver < ActiveRecord::Base
  belongs_to :user

  validates :user_id, :presence => true
  validates :street_address, :presence => true
  validates :street_name, :presence => true
  validates :city, :presence => true
  validates :state, :presence => true
  validates :zip_code, :presence => true
  validates :country, :presence => true

end
