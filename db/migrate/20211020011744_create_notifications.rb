class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :visitor_id, null: false  #通知する人(StaffMember)
      t.integer :visited_id, null: false  #通知される人(ParentMember)
      t.integer :daily_sheet_id
      t.string :action, default: "", null: false
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
  end
end
