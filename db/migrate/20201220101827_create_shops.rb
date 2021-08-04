class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :username
      t.string :password_digest
      t.string :address
      t.string :contact
      t.string :shopid

      t.timestamps
    end
  end
end
