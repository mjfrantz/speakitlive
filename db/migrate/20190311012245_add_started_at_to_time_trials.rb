class AddStartedAtToTimeTrials < ActiveRecord::Migration[5.2]
  def change
    add_column :time_trials, :started_at, :datetime
  end
end
