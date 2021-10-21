class DailySheet < ApplicationRecord
    belongs_to :student_member
    belongs_to :staff_member
    belongs_to :subject

    has_many :daily_texts, dependent: :destroy
    has_many :textbooks, :through => :daily_texts

    has_many :notifications, dependent: :destroy

    def parent_member_id
        self.student_member.parent_member.id
    end

    def create_notification_daily_sheet!(current_staff)
        notification = current_staff.active_notifications.new(
            daily_sheet_id: id,
            visited_id: parent_member_id,
            action: "create_daily_sheet"
        )
        notification.save if notification.valid?
    end

end
