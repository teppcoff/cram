class CreateDailySheets < ActiveRecord::Migration[6.1]
  def change
    create_table :daily_sheets do |t|
      t.references :student_member, index: true, foreign_key: true
      t.references :staff_member, index: true, foreign_key: true
      t.references :subject, index: true, foreign_key: true
      t.references :textbook, index: true, foreign_key: true

      t.date :study_date, null: false
      t.integer :period, null: false
      t.text :message, null: false
      t.text :information, null: false
      t.integer :participation, null: false

      t.timestamps
    end
  end
end
