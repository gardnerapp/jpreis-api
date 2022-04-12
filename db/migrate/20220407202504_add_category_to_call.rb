class AddCategoryToCall < ActiveRecord::Migration[7.0]
  def change
    add_column :calls, :category, :string
  end
end
