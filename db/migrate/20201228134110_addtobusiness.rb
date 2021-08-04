class Addtobusiness < ActiveRecord::Migration[6.0]
  def change
  	add_column :businesses,:unique_id,:string
  end
end
