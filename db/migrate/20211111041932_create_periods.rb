class CreatePeriods < ActiveRecord::Migration[6.1]
  def change
    create_table :periods do |t|
      t.integer :number_of_period, null: false  # ◯限の◯にあたる数字
      t.datetime :start_of_period, null: false  # 時限の授業の開始時刻 
      t.datetime :end_of_period, null: false    # 時限の授業の終了時刻 

      t.timestamps
    end
  end
end
