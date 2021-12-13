class AddReferenceToDailySheetAndPeriod < ActiveRecord::Migration[6.1]
  def change
    add_reference :daily_sheets, :period, index: true, foreign_key: true
  end
end
