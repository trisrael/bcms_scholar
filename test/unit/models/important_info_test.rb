require File.join(File.dirname(__FILE__), '/../../test_helper')

class ImportantInfoTest < ActiveSupport::TestCase

  test "should be able to create new block" do
    assert ImportantInfo.create!
  end
  
end