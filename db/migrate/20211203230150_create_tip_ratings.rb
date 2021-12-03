class CreateTipRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :tip_ratings do |t|
      t.integer :tip_id
      t.integer :user_id
      t.integer :rating_value

      t.timestamps
    end
  end
end
