require 'net/http'
class AjaxController < ApplicationController
  
  def upanel
    @time = Time.now.to_s
  end
  
  def search
    #選択ボックスに表示する出版社名を取得
    @books = Book.select(:publish).distinct
  end
  
  def result
    #選択ボックスで指定された出版社でbooksテーブルを検索
    @books = Book.where(publish: params[:publish])
  end
  
  def slideshow
    api_key = '6l3KXSmX'
    secret = 'mQjzn2xI'
    ts = Time.now.to_i
    h = Digest::SHA1.hexdigest(secret + ts.to_s)
    render plain: "https://www.slideshare.net/api/2/search_slideshows?q=Rails&lang=ja&api_key=#{api_key}&hash=#{h}&ts=#{ts}"
  end
  
  def search_slide
    api_key = '6l3KXSmX'
    secret = 'mQjzn2xI'
    ts = Time.now.to_i
    h = Digest::SHA1.hexdigest(secret + ts.to_s)
    Net::HTTP.start('www.slideshare.net', 443,
      use_ssl: true, ca_file: 'tmp/cacert.pem') do |https|
      res = https.get("/api/2/search_slideshows?q=#{ERB::Util.url_encode(params[:keywd])}&lang=ja&api_key=#{api_key}&hash=#{h}&ts=#{ts}")
      render json: Hash.from_xml(res.body).to_json
    end
  end
end
