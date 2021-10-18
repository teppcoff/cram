class CreateGoalSheets < ActiveRecord::Migration[6.1]
  def change
    create_table :goal_sheets do |t|
      t.references :student_member, index: true, foreign_key: true
      t.references :staff_member, index: true, foreign_key: true

      t.string :name, null: false
      t.integer :number_of_lessons, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
