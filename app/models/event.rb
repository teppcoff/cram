class Event < ApplicationRecord

    validates :title, presence: true
    validates :starts_at, presence: true
    validates :ends_at, presence: true
    validates :starts_on, presence: true
    validates :ends_on, presence: true
    validates :repeats_on, presence: true
    
    belongs_to :student_member
    belongs_to :staff_member
    belongs_to :subject
    belongs_to :period

end
