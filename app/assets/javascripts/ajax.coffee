#ページロード時に実行すべき処理
$(document).on 'turbolinks:load', ->
  #Ajax通信に成功したタイミングで実行
  $('#slide_search').on 'ajax:success', (e, data) ->
    $('#result').empty()
    $.each data.Slideshows.Slideshow, ->
      $('#result').append(
        $('<li></li>').append(
          $('<a></a>').attr('href', @URL).append("#{@Title} (#{@Description}) ")
        )
      ) 
  
  $(document).ajaxStart ->
    $('#progress').html '通信中...'
   .ajaxComplete ->
    $('#progress').html ''
    