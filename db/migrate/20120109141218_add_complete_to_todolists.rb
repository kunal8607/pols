class AddCompleteToTodolists < ActiveRecord::Migration
  def change
    add_column :todolists, :complete, :string
  end
end
