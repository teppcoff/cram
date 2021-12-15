class DailySheet < ApplicationRecord

    validates :study_date, presence: true
    validates :message, presence: true, length: { maximum: 200 }
    validates :information, presence: true, length: { maximum: 200 }
    validates :participation, presence: true

    enum participation: { attendant: 1, absent: 2, late: 3 }

    belongs_to :student_member
    belongs_to :staff_member
    belongs_to :subject
    belongs_to :textbook
    belongs_to :period
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
    
    scope :search, -> (search_params) do
        return if search_params.blank?
        student_member_id_is(search_params[:student_member_id])
    end
        scope :student_member_id_is, -> (student_member_id) { where(student_member_id: student_member_id) if student_member_id.present? }

end
