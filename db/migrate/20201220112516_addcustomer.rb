class Addcustomer < ActiveRecord::Migration[6.0]
  def change
  	add_column :customers, :email, :string
  end
end
