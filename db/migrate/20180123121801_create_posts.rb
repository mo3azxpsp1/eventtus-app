class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.text :content

      t.integer :user_id, default: 1

      t.timestamps
    end
  end
end
