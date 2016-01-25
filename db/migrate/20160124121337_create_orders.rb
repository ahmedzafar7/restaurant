class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.text :table
      t.text :notes

      t.timestamps null: false
    end
  end
end
