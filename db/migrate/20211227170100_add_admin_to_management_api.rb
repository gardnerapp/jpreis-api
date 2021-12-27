class AddAdminToManagementApi < ActiveRecord::Migration[7.0]
  def change
    add_column :management_apis, :admin, :boolean, default: false
  end
end
