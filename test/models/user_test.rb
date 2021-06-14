require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "users age" do
    user = users(:adult)
    refute user.is_minor
  end
end
