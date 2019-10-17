require 'test_helper'

class UserBracketsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_bracket = user_brackets(:one)
  end

  test "should get index" do
    get user_brackets_url, as: :json
    assert_response :success
  end

  test "should create user_bracket" do
    assert_difference('UserBracket.count') do
      post user_brackets_url, params: { user_bracket: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show user_bracket" do
    get user_bracket_url(@user_bracket), as: :json
    assert_response :success
  end

  test "should update user_bracket" do
    patch user_bracket_url(@user_bracket), params: { user_bracket: {  } }, as: :json
    assert_response 200
  end

  test "should destroy user_bracket" do
    assert_difference('UserBracket.count', -1) do
      delete user_bracket_url(@user_bracket), as: :json
    end

    assert_response 204
  end
end
