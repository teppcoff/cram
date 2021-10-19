class StaffMember < ApplicationRecord
    has_secure_password
    
    has_many :student_members
    has_many :goal_sheets, dependent: :destroy
    has_many :daily_sheets, dependent: :destroy

    enum employment_status: { permanent: 1, part_time: 2 }

    def full_name
        self.family_name + " " + self.given_name
    end
    
end
