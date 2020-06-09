class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :learning_goal
      t.integer :time_goal
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :completed

      t.timestamps
    end
  end
end
