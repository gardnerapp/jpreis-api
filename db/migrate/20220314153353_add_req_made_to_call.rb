class AddReqMadeToCall < ActiveRecord::Migration[7.0]
  def change
    add_column :calls, :req, :boolean, default: false
  end
end
