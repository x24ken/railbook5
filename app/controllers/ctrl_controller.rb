class CtrlController < ApplicationController
  
  #indexアクションに対してbeforeフィルターauthを登録
  
  before_action :auth, only: :index
  
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
  
  def show_photo
    #ルートパラメーターが指定されている場合はその値を、さもなければ１をセット
    id = params[:id] ? params[:id] : 1
    #authorsテーブルからid値をキーにレコードを取得
    @author = Author.find(id)
    #photo列（バイナリ型）をレスポンスとして出力
    send_data @author.photo, type: @author.ctype, disposition: :inline
  end
  
  def log
    logger.unknown('unknown')
    logger.fatal('fatal')
    logger.error('error')
    logger.warn('warn')
    logger.info('info')
    logger.debug('debug')
    render plain: 'ログはコンソール、またはログファイルから確認してください'
  end
  
  def get_xml
    @books = Book.all
    render xml: @books
  end
  
  def get_json
    @books = Book.all
    render json: @books
  end
  
  def cookie
    #テンプレート変数@emailにクッキー値をセット
    @email = cookies[:email]
  end
  
  def cookie_rec
    #クッキー:emailをセット（有効期限は3か月後)
    cookies[:email] = { value: params[:email],
      expires: 3.months.from_now, http_only: true }
    render plain: 'クッキーを保存しました'
  end
  
  def session_show
    @email = session[:email]
  end
  
  def session_rec
    session[:email] = params[:email]
    render plain: 'セッションを保存しました。'
  end
  
  #フィルターの動作を確認するためのindexアクションを定義
  def index
    sleep 3 #実行時刻に差をつけるための休止処理
    render plain: 'indexアクションが実行されました'
  end
  
  private
    def auth
      #認証用に利用するユーザー名/パスワード
      name = "yyamada"
      password = "8cb2237d0679ca88db6464eac60da96345513964"
      authenticate_or_request_with_http_basic('Railsbook') do |n, p|
        n == name &&
          Digest::SHA1.hexdigest(p) == password
      end
    end
end
