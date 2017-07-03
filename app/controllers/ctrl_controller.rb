class CtrlController < ApplicationController
  def para
    render plain: 'idパラメーター :' + params[:id]
  end
  
  def para_array
    render plain: 'categoryパラメーター :' + params[:category].inspect
  end
end
