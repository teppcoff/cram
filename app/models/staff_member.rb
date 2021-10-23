class StaffMember < ApplicationRecord
    has_secure_password
    
    has_many :student_members
    has_many :goal_sheets, dependent: :destroy
    has_many :daily_sheets, dependent: :destroy
    has_many :events

    has_many :active_notifications, class_name: "Notification", foreign_key: "visitor_id", dependent: :destroy

    enum employment_status: { permanent: 1, part_time: 2 }
    enum gender: { male: 1, female: 2, others: 3 }

    def full_name
        self.family_name + " " + self.given_name
    end
    
end
