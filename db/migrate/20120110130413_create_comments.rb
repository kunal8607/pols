class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :basecamp_id
      t.integer :author_id
      t.text :body
      t.datetime :created_on
      t.integer :post_id

      t.timestamps
    end
  end
end
