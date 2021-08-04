class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :customer_id
      t.string :status

      t.timestamps
    end
  end
end
