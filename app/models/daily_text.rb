class DailyText < ApplicationRecord
  belongs_to :daily_sheet
  belongs_to :textbook
end
