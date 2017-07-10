require 'test_helper'

class HelloControllerTest < ActionDispatch::IntegrationTest
  test "list action" do
    get '/hello/list'
    assert_equal 10, assigns(:books).length, 'found row is wrong'
    assert_response :success, 'list action failed.'
    assert_template 'hello/list'
  end
end
