class ParentMember < ApplicationRecord
    has_secure_password

    has_many :student_members
    has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy

    enum gender: { male: 1, female: 2, others: 3 }
end
