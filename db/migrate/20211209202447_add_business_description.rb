class AddBusinessDescription < ActiveRecord::Migration[6.0]
  def change
    add_column :businesses, :business_description, :text
  end
end
