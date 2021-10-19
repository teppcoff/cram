class CreateDailyTexts < ActiveRecord::Migration[6.1]
  def change
    create_table :daily_texts do |t|
      t.references :daily_sheet, index: true, foreign_key: true
      t.references :textbook, index: true, foreign_key: true

      t.timestamps
    end
  end
end
