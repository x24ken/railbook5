class LoginController < ApplicationController
  
  def auth
    usr = User.find_by(username: params[:username])
    if usr && usr.authenticate(params[:password]) then
      reset_session
      session[:usr] = usr.id
      redirect_to params[:referer]
    else
      flash.now[:referer] = params[:referer]
      @error = 'ユーザー名/パスワードが間違っています。'
      render 'index'
    end
  end
  
  def logout
    reset_session
    redirect_to '/'
  end
  
end