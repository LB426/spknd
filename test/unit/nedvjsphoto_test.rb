require 'test_helper'

class NedvjsphotoTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Nedvjsphoto.new.valid?
  end
end
