class CreateDeviceApis < ActiveRecord::Migration[7.0]
  def change
    create_table :device_apis do |t|
      t.string :name
      t.string :endpoint
      t.string :method
      t.string :queryparameters
      t.string :xmlparameters

      t.timestamps
    end
  end
end
