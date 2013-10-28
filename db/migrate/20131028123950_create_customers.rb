class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :age
      t.string :location
      t.string :description
      t.string :image_url

      t.timestamps
    end
  end
end
