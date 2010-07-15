require File.join(File.dirname(__FILE__), '/../../test_helper')

class FacultyBioTest < ActiveSupport::TestCase

  test "should be able to create new block" do
    assert FacultyBio.create!
  end
  
end