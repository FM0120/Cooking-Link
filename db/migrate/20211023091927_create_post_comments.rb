class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|
      t.integer :user_id
      t.integer :recipe_id
      t.string :comment

      t.timestamps
    end
  end
end
