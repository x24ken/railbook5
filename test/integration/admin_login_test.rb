require 'test_helper'

class AdminLoginTest < ActionDispatch::IntegrationTest
  test "login test" do
    #hello#viewアクションにアクセス
    get '/hello/view'
    #応答がリダイレクトであることを確認
    assert_response :redirect
    #リダイレクト先がlogin#indexアクションであるかをチェック
    assert_redirected_to controller: :login, action: :index
    #flash[:refere]に現在のURL「/hello/view」がセットされているか
    assert_equal '/hello/view', flash[:referer]
    
    #ログインページ(login/index)の表示をチェック
    follow_redirect!
    #応答が成功であることをチェック
    assert_response :success
    #flash[:refere]に、もともとの要求先[/hello/view]がセットされているか
    assert_equal '/hello/view', flash[:referer]
    
    #ユーザー名/パスワードを入力して、認証処理
    post '/login/auth',
    params: { username: 'yyamada', password: '12345',referer: '/hello/view' }
    #応答がリダイレクトであることをチェックする
    assert_response :redirect
    #リダイレクト先がhello#viewアクションであるかをチェック
    assert_redirected_to controller: :hello, action: :view
    #session[:user]に、usersテーブル:yyamadaのid列がセットされているかをチェック
    assert_equal users(:yyamada).id, session[:usr]
    
    #もともとの要求先である「/hello/view」が正しく表示できたかをチェック
    follow_redirect!
    assert_response :success
  end
end
