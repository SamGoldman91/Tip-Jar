class AddTitletoTip < ActiveRecord::Migration[6.0]
  def change
    add_column :tips, :title, :string
  end
end
