class CreateCalls < ActiveRecord::Migration[7.0]
  def change
    create_table :calls do |t|
      t.string :req_body
      t.string :req_endpoint
      t.string :req_verb
      t.string :resp_status
      t.string :resp_body

      t.timestamps
    end
  end
end
