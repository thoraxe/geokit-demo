class Toilet < ActiveRecord::Base
  attr_accessible :street-address, :city, :state, :zip, :rating, :lat, :lng
end
