class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.integer :basecampid
      t.string :name
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
