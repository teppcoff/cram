class CreateExaminations < ActiveRecord::Migration[6.1]
  def change
    create_table :examinations do |t|
      t.string :name, null: false
      t.integer :academic_year, null: false  # 年度
      t.references :school, index: true, foreign_key: true

      t.timestamps
    end
  end
end
