class AddColumnToLesson < ActiveRecord::Migration[5.2]
  def change
    add_reference :lessons, :teacher, foreign_key: true
  end
end
