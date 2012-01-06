class CreateTodolists < ActiveRecord::Migration
  def change
    create_table :todolists do |t|
      t.string :name
      t.integer :completed_count
      t.integer :uncompleted_count
      t.integer :project_id
      t.timestamps
    end
  end
end
