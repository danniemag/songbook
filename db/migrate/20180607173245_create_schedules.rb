class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.integer :group_id
      t.integer :song_id
      t.date :execution_date
      t.boolean :played

      t.timestamps
    end
  end
end
