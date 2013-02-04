class CreateTempOrders < ActiveRecord::Migration
  def change
    create_table :temp_orders do |t|

      t.timestamps
    end
  end
end
