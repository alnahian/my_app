class RemoveEmailPayTypeFromOrders < ActiveRecord::Migration
  def up
    remove_column :orders, :email
    remove_column :orders, :pay_type
  end

  def down
    add_column :orders, :pay_type, :string
    add_column :orders, :email, :string
  end
end
