class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.datetime :starts_at, null: false           # イベント開始時刻
      t.datetime :ends_at, null: false             # イベント終了時刻
      t.integer :event_type                        # 通常授業or予約型(生徒がカレンダーから予約)
      t.integer :repeat_count, default: 1

      t.references :period, index: true, foreign_key: true
      t.references :student_member, index: true, foreign_key: true
      t.references :staff_member, index: true, foreign_key: true
      t.references :subject, index: true, foreign_key: true

      t.timestamps
    end
  end
end
