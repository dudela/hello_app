require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "invalid signup test" do

    get signup_path

    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password: "foo",
                                         password_confirmation: "bar" } }
    end

    assert_template 'users/new'
    assert_select 'div#error_explanation'
  end

  test "valid signup test" do

    get signup_path

    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Chandu",
                                         email: "user@valid.com",
                                         password: "valid123",
                                         password_confirmation: "valid123" } }
    end

    follow_redirect!
    assert_template 'users/show'
  end
end
