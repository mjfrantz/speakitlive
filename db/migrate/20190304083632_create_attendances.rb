class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.boolean :presence
      t.boolean :late
      t.references :lesson, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
