class CreateMakings < ActiveRecord::Migration[5.2]
  def change
    create_table :makings do |t|
      t.string :making_detail
      t.integer :recipe_id
      t.string :image_id
      t.integer :making_number
      t.timestamps
    end
  end
end
