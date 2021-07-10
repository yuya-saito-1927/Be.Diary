class CreateDiaryDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :diary_details do |t|
      t.integer :diary_id
      t.string :title
      t.string :diary_detail_image_id
      t.text :action
      t.text :keep
      t.text :problem
      t.text :improve
      t.text :mind
      t.text :free

      t.timestamps
    end
  end
end
