require File.join(File.dirname(__FILE__), '/../../test_helper')

class UpdateTest < ActiveSupport::TestCase

  test "should be able to create new block" do
    assert Update.create!
  end
  
end