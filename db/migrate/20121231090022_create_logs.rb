class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.references :goal
      t.text :description
      t.date :activity_date

      t.timestamps
    end
    add_index :logs, :goal_id
  end
end
