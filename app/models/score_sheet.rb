class ScoreSheet < ApplicationRecord

    belongs_to :examination
    has_many :scores, dependent: :destroy

    accepts_nested_attributes_for :scores, allow_destroy: true

end
