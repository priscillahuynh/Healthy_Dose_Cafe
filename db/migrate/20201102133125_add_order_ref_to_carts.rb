class AddOrderRefToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :order, :string
    add_column :carts, :references, :string
  end
end
