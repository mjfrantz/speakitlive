class CreateInterestedUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :interested_users do |t|
      t.string :email

      t.timestamps
    end
  end
end
