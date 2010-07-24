require File.join(File.dirname(__FILE__), '/../../test_helper')

class LinksListTest < ActiveSupport::TestCase

  test "Should be able to create new instance of a portlet" do
    assert LinksListPortlet.create!(:name => "New Portlet")
  end
  
end