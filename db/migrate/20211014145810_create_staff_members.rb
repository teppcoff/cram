class CreateStaffMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :staff_members do |t|

      t.string :family_name, null: false
      t.string :given_name, null: false
      t.string :family_name_kana, null: false
      t.string :given_name_kana, null: false
      t.integer :gender, null: false
      t.date :birthday, null: false
      t.string :password_digest, null: false
      t.string :email, null: false
      t.integer :employment_status, null: false #雇用形態


      t.timestamps
    end
  end
end
