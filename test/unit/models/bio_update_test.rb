require File.join(File.dirname(__FILE__), '/../../test_helper')

class BioUpdateTest < ActiveSupport::TestCase

  test "should be able to create new block" do
    assert BioUpdate.create!
  end
  
end