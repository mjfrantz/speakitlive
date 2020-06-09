class AddCompletedToTimeTrials < ActiveRecord::Migration[5.2]
  def change
    add_column :time_trials, :completed, :boolean
    change_column_default :time_trials, :completed, false
  end
end
