class RemoveResponseFromRequest < ActiveRecord::Migration[7.0]
  def change
    rename_column "requests", "response_body", "body"
    rename_column "requests", "response_status", "status"
  end
end
