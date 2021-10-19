class Subject < ApplicationRecord

    has_many :takes, dependent: :destroy
    has_many :student_members, :through => :takes
    
    has_many :daily_sheets
    
end
