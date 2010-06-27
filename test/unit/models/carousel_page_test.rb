require File.join(File.dirname(__FILE__), '/../../test_helper')

class CarouselPageTest < ActiveSupport::TestCase

  test "should be able to create new block" do
    assert CarouselPage.create!
  end
  
end