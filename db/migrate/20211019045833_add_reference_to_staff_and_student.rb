class AddReferenceToStaffAndStudent < ActiveRecord::Migration[6.1]
  def change
    add_reference :student_members, :staff_member, index: true, foreign_key: true
  end
end
