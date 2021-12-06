class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.datetime :starts_at, null: false           # イベント開始時刻
      t.datetime :ends_at, null: false             # イベント終了時刻
      t.date :starts_on                            # イベントの初回日程
      t.date :ends_on                              # イベントの最終回日程
      t.integer :repeats_on                        # イベントの繰り返し、曜日(日曜日なら0、火曜日なら2)
      t.boolean :reservation_type, default: false  # trueなら生徒を空で登録する(予約型)

      t.references :period, index: true, foreign_key: true
      t.references :student_member, index: true, foreign_key: true
      t.references :staff_member, index: true, foreign_key: true
      t.references :subject, index: true, foreign_key: true

      t.timestamps
    end
  end
end
