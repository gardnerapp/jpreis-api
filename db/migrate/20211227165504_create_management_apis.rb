class CreateManagementApis < ActiveRecord::Migration[7.0]
  def change
    create_table :management_apis do |t|
      t.string :endpoint
      t.string :method
      t.string :queryparameters
      t.string :xmlparameters
      t.string :name

      t.timestamps
    end
  end
end
