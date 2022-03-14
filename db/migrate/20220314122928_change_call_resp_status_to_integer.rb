class ChangeCallRespStatusToInteger < ActiveRecord::Migration[7.0]
  def change
    change_column :calls, :resp_status, :integer
  end
end
