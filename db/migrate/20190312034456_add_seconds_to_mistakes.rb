class AddSecondsToMistakes < ActiveRecord::Migration[5.2]
  def change
    add_column :mistakes, :seconds, :float
  end
end
