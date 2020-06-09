class CreateTimeTrials < ActiveRecord::Migration[5.2]
  def change
    create_table :time_trials do |t|
      t.integer :seconds
      t.string :audio
      t.references :lesson, foreign_key: true
      t.references :error, foreign_key: true

      t.timestamps
    end
  end
end
