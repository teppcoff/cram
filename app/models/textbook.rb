class Textbook < ApplicationRecord

    validates :name, presence: true
    validates :text_type, presence: true

    belongs_to :subject
    has_many :daily_sheets
    
    enum text_type: { schoolbook: 1, workbook: 2, previous_exam_question: 3 }
end
