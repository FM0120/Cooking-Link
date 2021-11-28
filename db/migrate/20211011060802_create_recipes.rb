class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :user_id
      t.string :recipe_detail
      t.string :recipe_title
      t.string :image_id
      t.string :food
      t.string :trick
      t.string :name

      t.timestamps
    end
  end
end
