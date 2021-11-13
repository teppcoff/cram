class AddReferenceToStudentAndSchool < ActiveRecord::Migration[6.1]
  def change
    add_reference :student_members, :school, index: true, foreign_key: true
    
  end
end
