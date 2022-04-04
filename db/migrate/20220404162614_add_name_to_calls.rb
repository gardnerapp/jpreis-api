class AddNameToCalls < ActiveRecord::Migration[7.0]
  def change
    add_column :calls, :name, :string
  end
end
