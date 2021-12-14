class Textbook < ApplicationRecord

    validates :name, presence: true
    validates :text_type, presence: true

    enum text_type: { schoolbook: 1, workbook: 2, previous_exam_question: 3 }

    belongs_to :subject
    has_many :daily_sheets, dependent: :restrict_with_error

end
