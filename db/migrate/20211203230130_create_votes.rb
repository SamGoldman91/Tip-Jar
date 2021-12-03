class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.boolean :vote_type
      t.integer :tip_id
      t.integer :user_id

      t.timestamps
    end
  end
end
