class CreateHomeworks < ActiveRecord::Migration[5.2]
  def change
    create_table :homeworks do |t|
      t.text :comment
      t.boolean :approved, default: false
      t.references :mistake, foreign_key: true
      t.references :student, foreign_key: true
      t.timestamps
    end
  end
end
