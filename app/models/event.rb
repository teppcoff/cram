class Event < ApplicationRecord

    validates :title, presence: true
    validates :starts_at, presence: true
    validates :ends_at, presence: true
    
    belongs_to :student_member
    belongs_to :staff_member
end
