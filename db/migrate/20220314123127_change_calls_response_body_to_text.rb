class ChangeCallsResponseBodyToText < ActiveRecord::Migration[7.0]
  def change
    change_column :calls, :resp_body, :text
  end
end
