class RemoveNameKanaFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :name_kana, :string
  end
end
