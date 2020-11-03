class RemoveOrderRefFromLineItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :line_items, :order_id, :integer
  end
end
