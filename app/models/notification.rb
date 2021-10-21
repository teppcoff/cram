class Notification < ApplicationRecord

    default_scope -> { order(created_at: :desc) }

    belongs_to :daily_sheet, optional: true
    belongs_to :goal_sheet, optional: true

    belongs_to :visitor, class_name: "StaffMember", foreign_key: "visitor_id", optional: true
    belongs_to :visited, class_name: "ParentMember", foreign_key: "visited_id", optional: true
    
end
