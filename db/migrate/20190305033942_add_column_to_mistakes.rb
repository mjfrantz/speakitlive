class AddColumnToMistakes < ActiveRecord::Migration[5.2]
  def change
    add_reference :mistakes, :time_trial, foreign_key: true
  end
end
