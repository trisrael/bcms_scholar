require File.join(File.dirname(__FILE__), '/../../test_helper')

class BioTest < ActiveSupport::TestCase

  test "should be able to create new block" do
    assert Bio.create!
  end
  
end