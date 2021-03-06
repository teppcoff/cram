class CreateTextbooks < ActiveRecord::Migration[6.1]
  def change
    create_table :textbooks do |t|
      t.string :name, null: false
      t.integer :text_type, null: false #教科書、問題集、過去問等の分類
      t.references :subject, index: true, foreign_key: true
      
      t.timestamps
    end
  end
end
