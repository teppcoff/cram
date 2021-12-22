class ScoreSheet < ApplicationRecord

    belongs_to :examination
    belongs_to :student_member
    belongs_to :staff_member
    has_one :parent_member, through: :student_member
    has_many :scores, inverse_of: :score_sheet, dependent: :destroy
    has_many :scores, dependent: :destroy

    #score_sheetを作成する際にscoreも任意の数同時に作成する
    accepts_nested_attributes_for :scores, allow_destroy: true

    def total_point
        scores.sum(:point)
    end

    def point_of(subject)
        scores.where(subject_id: subject).first.point
    end

    scope :search, -> (search_params) do
        return if search_params.blank?
        student_member_id_is(search_params[:student_member_id])
    end
        scope :student_member_id_is, -> (student_member_id) { where(student_member_id: student_member_id) if student_member_id.present? }

end
