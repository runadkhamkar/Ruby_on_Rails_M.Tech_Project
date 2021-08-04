class CreateBusinesses < ActiveRecord::Migration[6.0]
  def change
    create_table :businesses do |t|
      t.integer :customer_id
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :status

      t.timestamps
    end
  end
end
