class CreateCtiMonitorApis < ActiveRecord::Migration[7.0]
  def change
    create_table :cti_monitor_apis do |t|
      t.string :name
      t.string :endpoint
      t.string :queryparameters
      t.string :method
      t.string :xmlparameters

      t.timestamps
    end
  end
end
