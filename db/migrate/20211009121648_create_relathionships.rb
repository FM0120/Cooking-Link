class CreateRelathionships < ActiveRecord::Migration[5.2]
  def change
    create_table :relathionships do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
  end
end
