class Event < ApplicationRecord
    belongs_to :student_member
    belongs_to :staff_member
end
