class GoalSheet < ApplicationRecord

    validates :name, presence: true
    validates :number_of_lessons, presence: true
    validates :description, presence: true

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

    scope :search, -> (search_params) do
        return if search_params.blank?
        student_member_id_is(search_params[:student_member_id])
    end
        scope :student_member_id_is, -> (student_member_id) { where(student_member_id: student_member_id) if student_member_id.present? }

end
