require File.join(File.dirname(__FILE__), '/../../test_helper')

class TopRightLinkTest < ActiveSupport::TestCase

  test "should be able to create new block" do
    assert TopRightLink.create!
  end
  
end