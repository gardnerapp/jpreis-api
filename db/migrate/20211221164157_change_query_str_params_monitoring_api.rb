class ChangeQueryStrParamsMonitoringApi < ActiveRecord::Migration[7.0]
  def change
    remove_column :monitoring_apis, :querystrdetails
    change_column :monitoring_apis, :querystrparameters, :json
  end
end
