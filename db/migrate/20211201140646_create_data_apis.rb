class CreateDataApis < ActiveRecord::Migration[7.0]
  def change
    create_table :data_apis do |t|
      t.string :name
      t.string :endpoint
      t.text :queryparameters

      t.timestamps
    end
  end
end
