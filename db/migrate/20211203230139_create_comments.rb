class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :tip_id
      t.integer :user_id
      t.string :comment_text

      t.timestamps
    end
  end
end
