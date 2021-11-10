class Event < ApplicationRecord

    validates :title, presence: true
    validates :starts_at, presence: true
    validates :ends_at, presence: true
    validates :period, presence: true
    
    belongs_to :student_member
    belongs_to :staff_member
    belongs_to :subject
    
    enum participation: { attendance: 1, absence: 2, late: 3 }

end
