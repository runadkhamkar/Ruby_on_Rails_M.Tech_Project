class Shop < ApplicationRecord
  has_secure_password
  geocoded_by :address
  after_validation :geocode
  has_many :lists
end
