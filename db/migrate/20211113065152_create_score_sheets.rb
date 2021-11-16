class CreateScoreSheets < ActiveRecord::Migration[6.1]
  def change
    create_table :score_sheets do |t|
      t.references :student_member, index: true, foreign_key: true
      t.references :staff_member, index: true, foreign_key: true
      t.references :examination, index: true, foreign_key: true

      t.timestamps
    end
  end
end
