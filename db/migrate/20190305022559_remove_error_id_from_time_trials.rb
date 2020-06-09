class RemoveErrorIdFromTimeTrials < ActiveRecord::Migration[5.2]
  def change
    remove_column :time_trials, :error_id
  end
end
