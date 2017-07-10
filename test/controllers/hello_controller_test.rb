require 'test_helper'

class HelloControllerTest < ActionDispatch::IntegrationTest
  test "list action" do
    get '/hello/list'
    assert_equal 10, assigns(:books).length, 'found row is wrong'
    assert_response :success, 'list action failed.'
    assert_template 'hello/list'
  end
  
  test "routing check" do
    assert_generates('hello/list', { controller: 'hello', action: 'list'})
    assert_recognizes({ controller: 'hello', action: 'list'}, 'hello/list')
  end
  
  test "select check" do
    get '/hello/list'
    #<title>要素がひとつでも存在するか
    assert_select 'title'
    #<title>要素がひとつでも存在するか
    assert_select 'title', true
    #<font>要素がひとつも存在しないか
    assert_select 'font', false
    #<title>要素配下のテキストが「Railbook」であるか
    assert_select 'title', 'Railbook'
    #<script>要素のdata-turbolinks-track属性が「reload」であるか
    assert_select 'script[data-turbolinks-track=?]', 'reload'
    #<title>要素配下のテキストが英数字で構成されているか
    assert_select 'title', /[A-Za-z0-9]+/
    #<table>要素配下にstyle属性を持った<tr>タグは１０個存在するか
    assert_select 'table' do
      assert_select 'tr[style]', 1..10
    end
    #<title>要素がひとつだけ存在し、テキストが「Railbook」であるか
    assert_select 'title', { count: 1, text: 'Railbook' }
  end
end
