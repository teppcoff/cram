class StaffMember < ApplicationRecord
    has_secure_password

    enum employment_status: { permanent: 1, part_time: 2 }
end
