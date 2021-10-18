class Subject < ApplicationRecord

    has_many :semesters, dependent: :destroy
    has_many :student_members, :through => :semesters
    
end
