class AddCategoryToMistakes < ActiveRecord::Migration[5.2]
  def change
    rename_column :mistakes, :type, :category
  end
end
