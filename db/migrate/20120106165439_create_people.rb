class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :email_address
      t.string :uuid
      t.string :title
      t.string :phone_number_mobile
      t.timestamps
    end
  end
end
