class School < ApplicationRecord

    validates :name, presence: true
    validates :school_type, presence: true

    enum school_type: { elementary_school: 1, junior_high_school: 2, high_school: 3 }

    has_many :examinations, dependent: :restrict_with_error
    has_many :student_members, dependent: :restrict_with_error

end
