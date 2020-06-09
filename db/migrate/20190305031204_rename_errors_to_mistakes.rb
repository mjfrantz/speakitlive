class RenameErrorsToMistakes < ActiveRecord::Migration[5.2]
  def change
    rename_table :errors, :mistakes
  end
end
