require 'test_helper'

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  setup do
    # instance variable begins with @, class variable with @@ and local variable with nothing
    @user = users(:one)
  end

  test "should show user" do
    get api_v1_user_url(@user), as: :json
    assert_response :success

    json_response = JSON.parse(self.response.body)
    assert_equal @user.email, json_response['data'][ 'attributes']['email']
  end


  test "should create user" do
    assert_difference('User.count') do
      post api_v1_users_url, params: { user: {email: 'test@test.org', password: '12345'} }, as: :json
    end
    assert_response :success
  end

  test "should not create user with taken email" do
    assert_no_difference('User.count') do
      post api_v1_users_url, params: { user: {email: @user.email, password: '12345'} }, as: :json
    end
      assert_response :unprocessable_entity
  end

  # test "should update user" do
  #   patch api_v1_user_url(@user), params: {user: {email: @user.email, password: '123456'}}, as: :json
  #   assert_response :success
  # end

  # test "should not update other user" do
  #   patch api_v1_user_url(@user), params: {user: {email: 'bad-email', password: '123456'}}, as: :json
  #   assert_response :unprocessable_entity
  # end

  test "should update user" do 
    patch api_v1_user_url(@user),
    params: { user: { email: @user.email } },
    headers: { Authorization: JsonWebToken.encode(user_id: @user.id) }, as: :json
    assert_response :success
  end

  test "should forbid update user" do
    patch api_v1_user_url(@user), params: { user: { email:@user.email } }, as: :json 
    assert_response :forbidden
  end

  # test "should delete user" do
  #   assert_difference "User.count", -1 do
  #     delete api_v1_user_url(@user), as: :json
  #   end
  #   assert_response :no_content
  # end

  test "should destroy user" do 
    assert_difference('User.count', -1) do
      delete api_v1_user_url(@user), headers: { Authorization: JsonWebToken.encode(user_id: @user.id) }, as: :json
    end
    assert_response :no_content 
  end

  test "should forbid destroy user" do 
    assert_no_difference('User.count') do
      delete api_v1_user_url(@user), as: :json 
    end
    assert_response :forbidden 
  end
end
