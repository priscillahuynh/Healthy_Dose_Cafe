class RenameOrderToOrderId < ActiveRecord::Migration[5.2]
  def change
    rename_column :carts, :order, :order_id
  end
end
