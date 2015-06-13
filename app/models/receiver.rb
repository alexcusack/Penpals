class Receiver < ActiveRecord::Base
  # Remember to create a migration!
  validates :street_address, :presence => true
  validates :street_name, :presence => true
  validates :city, :presence => true
  validates :state, :presence => true
  validates :zip_code, :presence => true
  validates :country, :presence => true
end
