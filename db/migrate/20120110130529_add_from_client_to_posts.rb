class AddFromClientToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :from_client, :integer
  end
end
