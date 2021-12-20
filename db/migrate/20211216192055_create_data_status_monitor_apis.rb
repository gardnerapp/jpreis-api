class CreateDataStatusMonitorApis < ActiveRecord::Migration[7.0]
  def change
    create_table :data_status_monitor_apis do |t|
      t.string :name
      t.string :endpoint
      t.string :method
      t.string :queryparameters
      t.string :xmlparameters

      t.timestamps
    end
  end
end
