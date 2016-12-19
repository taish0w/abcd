require 'test_helper'

class QuizControllerTest < ActionDispatch::IntegrationTest
  test "should get answer" do
    get quiz_answer_url
    assert_response :success
  end

  test "should get master" do
    get quiz_master_url
    assert_response :success
  end

  test "should get button" do
    get quiz_button_url
    assert_response :success
  end

end
