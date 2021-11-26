class School < ApplicationRecord

    validates :name, presence: true
    validates :school_type, presence: true

    has_many :examinations
    has_many :student_members
    
    enum school_type: { elementary_school: 1, junior_high_school: 2, high_school: 3 }

end
