class Event < ApplicationRecord

    validates :title, presence: true
    validates :starts_at, presence: true
    validates :ends_at, presence: true
    
    belongs_to :student_member, optional: true
    belongs_to :staff_member
    belongs_to :subject
    belongs_to :period

    enum event_type: { ordinary_type: 1, reservation_type: 2 }
    
end
