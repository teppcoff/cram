class Examination < ApplicationRecord

    belongs_to :school
    has_many :score_sheets
    
end
