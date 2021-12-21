class ChangeMonitoringQueryParametersToJson < ActiveRecord::Migration[7.0]
  def change
    change_column :monitoring_apis, :queryparameters, :json
  end
end
