class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :username
      t.string :password_digest
      t.string :address
      t.string :contact
      t.string :gender
      t.datetime :dob

      t.timestamps
    end
  end
end
