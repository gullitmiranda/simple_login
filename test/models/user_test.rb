require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save user empty" do
    user = create(email: nil, password: nil)
    assert !user.save, "User empty"
  end

  test "should require email" do
    user = create(email: nil)
    assert !user.valid?, "User without a email"
  end

  test "should require password" do
    user = create(password: nil)
    assert !user.valid?, "User without a password"
  end

  test "should deny duplicate user" do
    user = create
    assert user.valid?

    user = create
    assert !user.valid?, "User duplicate"
  end

  private

  def create(options={})
    User.create({
      email: "Email",
      password: "Password"
      }.merge(options))
  end
end
