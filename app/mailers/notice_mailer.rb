class NoticeMailer < ApplicationMailer
  
  layout 'mail'
  
  default from: 'webmaster@wings.msn.to',
          cc: 'CQW15204@nifty.com'
  
  def sendmail_confirm(user)
    @user = user
    mail(to: user.email,
        subject: 'ユーザー登録ありがとうございました') do |format|
      format.text { render inline: 'HTML対応クライアントで受信ください' }
      format.html
    end
  end
end
