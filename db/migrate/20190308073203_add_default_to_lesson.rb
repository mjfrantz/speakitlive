class AddDefaultToLesson < ActiveRecord::Migration[5.2]
  def change
    change_column_default :lessons, :start_time, DateTime.now
  end
end
