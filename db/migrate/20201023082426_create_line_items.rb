class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.integer :quantity, default: 1
      t.text :special_request
      t.belongs_to :product, foreign_key: true
      t.belongs_to :cart, foreign_key: true
      t.belongs_to :order, foreign_key: true

      t.timestamps
    end
  end
end
