class DailySheet < ApplicationRecord

    validates :study_date, presence: true
    validates :message, presence: true
    validates :information, presence: true
    validates :period, presence: true

    belongs_to :student_member
    belongs_to :staff_member
    belongs_to :subject

    has_many :daily_texts, dependent: :destroy
    has_many :textbooks, :through => :daily_texts

    has_many :notifications, dependent: :destroy

    def create_notification_daily_sheet!(current_staff)
        temp_id = self.student_member.parent_member.id
        save_notification_daily_sheet!(current_staff, temp_id)
    end

    def save_notification_daily_sheet!(current_staff, visited_id)
        notification = current_staff.active_notifications.new(
            daily_sheet_id: id,
            visited_id: visited_id,
            action: "create_daily_sheet"
        )
        notification.save if notification.valid?
    end

end
