class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.decimal :total, precision: 7, scale: 2
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
