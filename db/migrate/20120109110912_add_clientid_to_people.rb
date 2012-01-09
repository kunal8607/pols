class AddClientidToPeople < ActiveRecord::Migration
  def change
    add_column :people, :clientid, :integer
  end
end
