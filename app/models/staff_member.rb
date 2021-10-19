class StaffMember < ApplicationRecord
    has_secure_password
    has_many :goal_sheets, dependent: :destroy
    has_many :daily_sheets, dependent: :destroy

    enum employment_status: { permanent: 1, part_time: 2 }
end
