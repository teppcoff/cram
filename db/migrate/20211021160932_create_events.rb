class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :starts_at
      t.datetime :ends_at
      t.references :student_member, index: true, foreign_key: true
      t.references :staff_member, index: true, foreign_key: true

      t.timestamps
    end
  end
end
