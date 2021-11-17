class Examination < ApplicationRecord

    validates :name, presence: true
    belongs_to :school
    has_many :score_sheets
    
end
