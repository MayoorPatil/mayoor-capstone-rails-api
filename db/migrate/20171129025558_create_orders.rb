class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :address
      t.string :email
      t.integer :phone_number
      t.decimal :amount

      t.timestamps
    end
  end
end
