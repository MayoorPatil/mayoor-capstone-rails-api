class ChangeOrderToHavePhoneNumerAsBigInt < ActiveRecord::Migration[5.1]
  def change
    change_column :orders, :phone_number, :bigint
  end
end
