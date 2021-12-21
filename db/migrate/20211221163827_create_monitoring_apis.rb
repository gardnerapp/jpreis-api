class CreateMonitoringApis < ActiveRecord::Migration[7.0]
  def change
    create_table :monitoring_apis do |t|
      t.string :name
      t.string :endpoint
      t.string :method
      t.string :queryparameters
      t.string :querystrparameters
      t.string :guidelines
      t.json :querystrdetails

      t.timestamps
    end
  end
end
