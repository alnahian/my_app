class AddPaymentToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :paid_amount, :decimal
    add_column :orders, :due_amount, :decimal
    add_column :orders, :previous_due, :decimal
    add_column :orders, :excerpt, :string
    add_column :orders, :published_at, :datetime
  end
end
