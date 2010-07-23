require File.join(File.dirname(__FILE__), '/../../test_helper')

class TestimonialTest < ActiveSupport::TestCase

  test "should be able to create new block" do
    assert Testimonial.create!
  end
  
end