class Addbusiness < ActiveRecord::Migration[6.0]
  def change
  	add_column :businesses,:shop_id,:integer
  end
end
