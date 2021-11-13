class Score < ApplicationRecord

    validates :point, presence: true

    belongs_to :score_sheet
    belongs_to :subject

end
