class Period < ApplicationRecord

    validates :number_of_period, presence: true
    has_many :events
    has_many :daily_sheets

end
