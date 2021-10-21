class GoalSheet < ApplicationRecord
    belongs_to :student_member
    belongs_to :staff_member

    has_many :notifications, dependent: :destroy
    
end
