class CreateTakes < ActiveRecord::Migration[6.1]
  def change
    create_table :takes do |t|
      t.references :student_member, index: true, foreign_key: true
      t.references :subject, index: true, foreign_key: true

      t.timestamps
    end
  end
end
