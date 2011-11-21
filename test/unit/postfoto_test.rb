require 'test_helper'

class PostfotoTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Postfoto.new.valid?
  end
end
