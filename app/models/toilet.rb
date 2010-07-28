class Toilet < ActiveRecord::Base
  attr_accessible :street_address, :city, :state, :zip, :rating, :lat, :lng
end
