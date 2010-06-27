require File.join(File.dirname(__FILE__), '/../../test_helper')

class StyleSheetTest < ActiveSupport::TestCase

  test "should be able to create new block" do
    assert StyleSheet.create!
  end
  
end