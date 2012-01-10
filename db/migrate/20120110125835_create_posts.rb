class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :id
      t.integer :basecamp_id
      t.integer :author_id
      t.string :author_name
      t.datetime :posted_on
      t.text :body
      t.string :title
      t.integer :client_id

      t.timestamps
    end
  end
end
