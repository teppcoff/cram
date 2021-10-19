class AddReferenceToParentAndStudent < ActiveRecord::Migration[6.1]
  def change
    add_reference :student_members, :parent_member, index: true, foreign_key: true
  end
end
