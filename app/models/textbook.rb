class Textbook < ApplicationRecord

    validates :name, presence: true
    has_many :daily_texts, dependent: :destroy
    has_many :daily_sheets, :through => :daily_texts
    
    enum text_type: { schoolbook: 1, workbook: 2, previous_exam_question: 3 }
end
