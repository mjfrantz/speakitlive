class AddCompletedToHomeworks < ActiveRecord::Migration[5.2]
  def change
    add_column :homeworks, :completed, :boolean, default: false
  end
end
