class GoalSheet < ApplicationRecord
    belongs_to :student_member
    belongs_to :staff_member

    has_many :notifications, dependent: :destroy
    
    def parent_member_id
        self.student_member.parent_member.id
    end

    def create_notification_goal_sheet!(current_staff)
        notification = current_staff.active_notifications.new(
            goal_sheet_id: id,
            visited_id: parent_member_id,
            action: "create_goal_sheet"
        )
        notification.save if notification.valid?
    end

end
