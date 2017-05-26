module ViewHelper
  #datetime : 整形対象の日付時刻値 ( Timeオブジェクト)
  #type : 出力形式 (日付時刻 : datetime, 日付のみ: date, 時刻のみ :time)
  def format_datetime(datetime, type = :datetime)
    #引数datetimeがnilの場合は空文字列を返す
    return '' unless datetime
    
    #引数typeの値に応じて対応するフォーマット文字列をセット
    
    case type
      when :datetime
        format = '%Y年%m月%d日 %H:%M:%S'
      when :date
        format = '%Y年%m月%d日'
      when :time
        format = '%H:%M:%S'
    end
    
    #指定されたフォーマットで日付時刻値を整形
    datetime.strftime(format)
  end
  
  #collection : リストのもととなるオブジェクト配列
  #prop : 一覧するプロパティ名
  def list_tag(collection, prop)
    #<ul>要素を生成
    content_tag(:ul) do
    #<ul>要素配列したの<li>要素を順に生成
      collection.each do |element|
        concat content_tag(:li, element.attributes[prop])
      end
    end
  end
end