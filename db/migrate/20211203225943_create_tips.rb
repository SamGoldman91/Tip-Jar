class CreateTips < ActiveRecord::Migration[6.0]
  def change
    create_table :tips do |t|
      t.string :tip_text
      t.string :tip_pic
      t.integer :user_id
      t.integer :business_id
      t.string :tip_type
      t.integer :upvote_count
      t.integer :downvote_count

      t.timestamps
    end
  end
end
