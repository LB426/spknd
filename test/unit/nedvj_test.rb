require 'test_helper'

class NedvjTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Nedvj.new.valid?
  end
end
