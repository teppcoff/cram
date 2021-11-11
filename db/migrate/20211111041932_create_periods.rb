class CreatePeriods < ActiveRecord::Migration[6.1]
  def change
    create_table :periods do |t|
      t.integer :number_of_period, null: false
      t.datetime :start_of_period, null: false
      t.datetime :end_of_period, null: false

      t.timestamps
    end
  end
end
