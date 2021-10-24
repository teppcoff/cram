class CreateStudentMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :student_members do |t|

      t.string :family_name, null: false
      t.string :given_name, null: false
      t.string :family_name_kana, null: false
      t.string :given_name_kana, null: false
      t.integer :gender, null: false
      t.date :birthday, null: false
      t.string :password_digest, null: false
      t.integer :school_type, null: false #小中高の区分
      t.integer :school_year, null: false #学年(年次のみ)

      t.timestamps
    end
    add_index :student_members, :family_name_kana
    add_index :student_members, :given_name_kana
  end
end
