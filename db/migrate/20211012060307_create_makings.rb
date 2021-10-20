class CreateMakings < ActiveRecord::Migration[5.2]
  def change
    create_table :makeings do |t|
      t.string:makeing
      t.integer:recipe_id
      t.string:image_id
      t.integer:makeing_number
      t.timestamps
    end
  end
end
