class ScoreSheet < ApplicationRecord

    belongs_to :examination
    belongs_to :student_member
    belongs_to :staff_member
    has_many :scores, dependent: :destroy

    accepts_nested_attributes_for :scores, allow_destroy: true

    scope :search, -> (search_params) do
        return if search_params.blank?
        student_member_id_is(search_params[:student_member_id])
    end
        scope :student_member_id_is, -> (student_member_id) { where(student_member_id: student_member_id) if student_member_id.present? }

end