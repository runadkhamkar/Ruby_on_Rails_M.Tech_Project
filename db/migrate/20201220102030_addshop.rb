class Addshop < ActiveRecord::Migration[6.0]
  def change
  	add_column :shops, :email, :string
  end
end
