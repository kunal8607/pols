class CreateBasecampProjects < ActiveRecord::Migration
  def change
    create_table :basecamp_projects do |t|
      t.integer :basecampid
      t.string :name
      t.string :status
      t.date :created_on
      t.integer :company_id

      t.timestamps
    end
  end
end
