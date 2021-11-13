class CreateExaminations < ActiveRecord::Migration[6.1]
  def change
    create_table :examinations do |t|
      t.string :name, null: false
      t.references :school, index: true, foreign_key: true

      t.timestamps
    end
  end
end
