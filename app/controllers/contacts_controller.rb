class ContactsController < ApplicationController
  
  #お問い合わせ入力画面
  def new
    @contact = Contact.new
  end 
  
  #お問い合わせ内容確認画面
  def confirm
    @contact = Contact.new(contact_params)
    #内容に不備があった場合作成画面に戻る
    if @contact.invalid?
      render :new
    end
  end
  
  #お問い合わせ内容修正画面
  def back
    @contact = Contact.new(contact_params)
    render :new
  end
  
  #お問い合わせ作成処理
  def create
    @contact = Contact.new(contact_params)
    #作成処理完了の場合、メール送信
    if @contact.save
      ContactMailer.send_mail(@contact).deliver_now
      redirect_to done_path
    #処理失敗の場合作成画面に
    else
      render :new
    end
  end
  
  #お問い合わせ完了画面
  def done
  end
  
  private

  def contact_params
    params.require(:contact).permit(:email, :name, :phone_number, :subject, :message)
  end
  
end
