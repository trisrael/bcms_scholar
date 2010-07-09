require File.join(File.dirname(__FILE__), '/../../test_helper')

class SocialMediaHeaderTest < ActiveSupport::TestCase

  test "should be able to create new block" do
    assert SocialMediaHeader.create!
  end
  
end