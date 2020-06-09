class AddFirstNameToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :first_name, :string
    add_column :students, :last_name, :string
    add_column :students, :birth_date, :date
    add_column :students, :student_number, :string
    add_column :students, :score, :integer
  end
end
