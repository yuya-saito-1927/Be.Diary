class Contact < ApplicationRecord

  #enumによる選択肢の処理登録
  enum subject: { "会員等について": 0, "日記について": 1, "日記内容について": 2, "コメントについて": 3, "その他のお問い合わせ": 4 }

  #バリテーション設定
  validates :name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
  validates :subject, presence: true
  validates :message, presence: true

end
