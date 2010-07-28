class Toilet < ActiveRecord::Base
  attr_accessible :street_address, :city, :state, :zip, :rating, :lat, :lng
  acts_as_mappable :auto_geocode => true

  def address
    return "#{self.street_address}, #{self.city}, #{self.state}, #{self.zip}"
  end
end

