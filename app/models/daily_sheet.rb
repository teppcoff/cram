class DailySheet < ApplicationRecord
    belongs_to :student_member
    belongs_to :staff_member
    belongs_to :subject
    
    has_many :daily_texts, dependent: :destroy
    has_many :textbooks, :through => :daily_texts
end
