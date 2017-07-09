class ApplicationController < ActionController::Base
  # before_action :check_logined
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #RecordNotFound例外を処理するのはid_invalidメゾット
  rescue_from ActiveRecord::RecordNotFound, with: :id_invalid
  
  add_flash_types :info
  
  
  private
  
    def check_logined
      if session[:usr] then
        begin
          @usr = User.find(session[:usr])
        rescue ActiveRecord::RecordNotFound
          reset_session
        end
      end
      unless @usr
        flash[:referer] = request.fullpath
        redirect_to controller: :login, action: :index
      end
    end
    
    def id_invalid(e)
      #ステータス404(Not Found)で指定ビューを描画
      render 'shared/record_not_found', status: 404
    end
end
