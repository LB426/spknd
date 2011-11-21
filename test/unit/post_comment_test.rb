require 'test_helper'

class PostCommentTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert PostComment.new.valid?
  end
end
