class CtrlController < ApplicationController
  def para
    render plain: 'idパラメーター :' + params[:id]
  end
  
  def para_array
    render plain: 'categoryパラメーター :' + params[:category].inspect
  end
  
  def req_head
    render plain: request.headers["User-Agent"]
  end
  
  def req_head2
    @headers = request.headers
  end
  
  def upload_process
    #アップロードファイルを取得
    file = params[:upfile]
    #ファイルのベース名（パスを除いた部分)を取得
    name = file.original_filename
    #許可する拡張子を定義
    perms = ['.jpeg', '.jpeg', '.gif', '.png']
    #配列permsにアップロードファイルの拡張子に合致するものがあるか
    if !perms.include?(File.extname(name).downcase)
      result = 'アップロードできるのは画像ファイルのみです。'
    #アップロードファイルのサイズが1MB以下であるか
    elsif file.size > 1.megabyte
      result = 'ファイルサイズは1MBまでです。'
    else
      #/public/docフォルダ配下にアップロードファイルを保存
      File.open("public/docs/#{name}", 'wb') { |f| f.write(file.read) }
      result = "#{name}をアップロードしました。"
    end
    #成功/エラーメッセージを保存
    render plain: result
  end
  
  def updb
    @author = Author.find(params[:id])
  end

  def updb_process
    @author = Author.find(params[:id])
    if @author.update(params.require(:author).permit(:data))
      render plain: '保存に成功しました。'
    else
      render plain: @author.errors.full_messages[0]
    end
  end
    
end
