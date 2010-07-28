require 'test_helper'

class ToiletTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Toilet.new.valid?
  end
end
