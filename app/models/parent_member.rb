class ParentMember < ApplicationRecord
    has_secure_password

    has_many :student_members
end
