class Subject < ApplicationRecord

    validates :name, presence: true
    enum school_type: { elementary_school: 1, junior_high_school: 2, high_school: 3 }

    has_many :takes, dependent: :destroy
    has_many :student_members, through: :takes
    has_many :textbooks
    has_many :events
    has_many :daily_sheets
    
end
