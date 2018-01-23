class CreateReactions < ActiveRecord::Migration[5.1]
  def change
    create_table :reactions do |t|

    	t.integer :user_id, default: 1
    	t.integer :post_id

      t.timestamps
    end
  end
end
