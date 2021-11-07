class Subject < ApplicationRecord

    validates :name, presence: true

    has_many :takes, dependent: :destroy
    has_many :student_members, :through => :takes
    has_many :textbooks
    
    has_many :daily_sheets
    
end
