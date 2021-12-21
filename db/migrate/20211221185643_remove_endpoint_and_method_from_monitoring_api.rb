class RemoveEndpointAndMethodFromMonitoringApi < ActiveRecord::Migration[7.0]
  def change
    remove_column :monitoring_apis, :method
    remove_column :monitoring_apis, :endpoint
  end
end
